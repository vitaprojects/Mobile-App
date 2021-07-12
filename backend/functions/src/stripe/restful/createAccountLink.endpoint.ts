import { Post } from "firebase-backend";
import { Request, Response } from "express";
import { RspData } from "../../models/models";
import { StripeService } from "../../services/stripe_service";
export default new Post(async (req: Request, resp: Response) => {
  try {
    const stripeId = req.body["stripeId"];
    if (stripeId != null) {
      const stripeService: StripeService = new StripeService();
      const accountResponse = await stripeService.createAccountLink(stripeId);
      if (accountResponse != null) {
        const rspdata: RspData = {
          status_code: 201,
          data: {
            account_link: accountResponse,
          },
        };
        resp.status(201).send(rspdata);
      } else {
        const rspData: RspData = {
          status_code: 400,
          error: {
            message: "Error Occured while creating an account link",
          },
        };
        resp.status(rspData.status_code).send(rspData);
      }
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
