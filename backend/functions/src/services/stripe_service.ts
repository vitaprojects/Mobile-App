import Stripe from "stripe";
import { config } from "firebase-functions";
import { firestore } from "firebase-admin";
import { RspData } from "../models/models";
const stripe = new Stripe(config().stripe.key, {
  apiVersion: "2020-08-27",
});
export class StripeService {
  async createAccount(email: string): Promise<RspData> {
    try {
      const account = await stripe.accounts.create({
        type: "express",
        email: email,
        capabilities: {
          transfers: { requested: true },
        },
        settings: {
          payouts: {
            schedule: {
              interval: "manual",
            },
          },
        },
      });
      await this.notifyUserDoc(email, account.id);
      const res = await this.createAccountLink(account.id);
      return {
        status_code: 201,
        data: {
          stripeId: account.id,
          account_link: res,
        },
      };
    } catch (e) {
      error(
        `error occured while trying to create stripe account ${e}`,
        "createAccount"
      );
      return {
        status_code: 400,
        error: {
          message: "Cannot Create Stripe Account at the moment",
          reason_phrase: e,
        },
      };
    }
  }

  async createAccountLink(stripeId: string): Promise<void | string> {
    try {
      const accountLink = await stripe.accountLinks.create({
        account: stripeId,
        refresh_url:
          "https://newpostman1.page.link/?link=https://www.example.com/submitDetails?type%refresh&apn=com.exzitan.newpostman1",
        return_url:
          "https://newpostman1.page.link/?link=https://www.example.com/submitDetails?type%3Dreturn&apn=com.exzitan.newpostman1",
        type: "account_onboarding",
      });
      return accountLink.url;
    } catch (e) {
      error(
        "cannot create an account link for the provided stripe id",
        "createAccountLink"
      );
    }
  }

  private async notifyUserDoc(email: string, stripeId: string): Promise<void> {
    try {
      log(`Excecuting notify user document`, "notifyUserDoc");
      await firestore().collection("users").doc(email).update({
        stripeId: stripeId,
      });
    } catch (e) {
      error(
        `Error Occured While trying to update userDoc ${e}`,
        "notifyUserDoc"
      );
    }
  }
  async withdraw(
    email: string,
    stripeId: string,
    amount: number,
    userId: string
  ): Promise<RspData> {
    try {
      const canWithdraw = await this.checkIfCanWithdraw(email, amount);
      if (canWithdraw != null) {
        if (canWithdraw) {
          const transferRes = await this.createTransfer(amount, stripeId);
          if (transferRes) {
            const payoutRes = await this.createPayout(
              stripeId,
              amount,
              userId,
              email
            );
            return payoutRes;
          } else {
            return {
              status_code: 400,
              error: {
                message:
                  "Cannot initiate the request for the provided stripe id",
                reason_phrase:
                  "Seems like the provided stripe id is invalid or some other error has occured",
              },
            };
          }
        } else {
          return {
            status_code: 400,
            error: {
              message:
                "Your withdraw amount is higher than your available balance to withdraw",
              reason_phrase:
                "cannot withdraw since the withdraw amount is higher",
            },
          };
        }
      } else {
        return {
          status_code: 400,
          error: {
            message: "An Error Occured when processing the user.",
            reason_phrase: "Cannot find a user for the provided email",
          },
        };
      }
    } catch (error) {
      return {
        status_code: 404,
        error: {
          message: "An error occured while trying to initiate withdraw",
          reason_phrase: error,
        },
      };
    }
  }

  private async createTransfer(
    amount: number,
    stripeId: string
  ): Promise<boolean> {
    try {
      const transfer = await stripe.transfers.create({
        amount: amount,
        currency: "cad",
        destination: stripeId,
      });
      log(
        `transfered ${amount} to account ${stripeId} : transfer id :${transfer.id}`,
        "createTransfer"
      );
      return true;
    } catch (e) {
      error(
        `Cannot transfer for the provided connected account ${e}`,
        "createTransfer"
      );
      return false;
    }
  }

  private async createPayout(
    stripeId: string,
    amount: number,
    userId: string,
    email: string
  ): Promise<RspData> {
    try {
      const payout = await stripe.payouts.create(
        {
          amount: amount,
          currency: "cad",
          metadata: {
            userId: userId,
            email: email,
          },
        },
        { stripeAccount: stripeId }
      );
      await this.updateCleared(amount, email);
      log(`Payout successfull ${payout.id}`, "createPayout");
      return {
        status_code: 201,
        data: {
          payoutId: payout.id,
        },
      };
    } catch (error) {
      return {
        status_code: 400,
        error: {
          message: "cannot create payout at the moment.",
          reason_phrase: error,
        },
      };
    }
  }
  async updateCleared(amount: number, email: string): Promise<void> {
    const dbRef = firestore().collection("users").doc(email);
    const rAmount: number = parseFloat((amount / 100).toFixed(2));
    return dbRef.firestore.runTransaction(async (handler) => {
      const cleanerSnap = await handler.get(dbRef);

      if (cleanerSnap.exists) {
        const userdata = cleanerSnap.data()!;
        const totalCleaned = userdata.totalCleared + rAmount;
        handler.update(dbRef, {
          totalCleared: parseFloat(totalCleaned.toFixed(2)),
        });
      } else {
        log("no user found for the email", "updateAmountToWithdraw");
      }
    });
  }

  async checkIfCanWithdraw(
    email: string,
    amount: number
  ): Promise<void | boolean> {
    try {
      const docRef = firestore().collection("users").doc(email);
      const withdrawAmount: number = parseFloat((amount / 100).toFixed(2));
      const res: number = await docRef.firestore.runTransaction(
        async (handler) => {
          const result = await handler.get(docRef);
          if (result.exists) {
            const data = result.data()!;
            const availableToWithdraw: number = parseFloat(
              (data.totalEarnings - data.totalCleared).toFixed(2)
            );
            return availableToWithdraw;
          } else {
            throw "there is no user found for the curresponding email";
          }
        }
      );
      if (res >= withdrawAmount) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      error(
        `an error occured when trying to look if the user is eligible to withdraw ${e}`,
        "checkIfCanWithdraw"
      );
    }
  }
}
function log(message: string, functionName: string) {
  console.log(`Stripe Service | ${functionName} | ${message} `);
}
function error(message: string, functionName: string) {
  console.log(`Stripe Service | Error |${functionName} | ${message}`);
}
