import { Request, Response } from "express";
import { Post } from "firebase-backend";
import { RspData } from "../../models/models";
import { StripeService } from "../../services/stripe_service";

export default new Post(async (req: Request, resp: Response) => {
  try {
    log("Creating an account endpoint called");
    const email = req.body["email"];
    if (email != null) {
      const stripeService: StripeService = new StripeService();
      const accountResponse = await stripeService.createAccount(email);
      resp.status(accountResponse.status_code).send(accountResponse);
    } else {
      const rsp: RspData = {
        status_code: 404,
        error: {
          message: "Missing Parameters.",
          reason_phrase: "Parameter Email is required",
        },
      };
      resp.status(rsp.status_code).send(rsp);
    }
  } catch (e) {
    error(`error occured when creating an account ${e}`);
    const rsp: RspData = {
      status_code: 400,
      error: {
        message: "An error Occured while trying to create an account",
        reason_phrase: e,
      },
    };
    resp.status(rsp.status_code).send(rsp);
  }
});
function log(message: string) {
  console.log(`Create Account Endpoint | ${message} `);
}
function error(message: string) {
  console.log(`Create Account Endpoint | Error |  ${message}`);
}
