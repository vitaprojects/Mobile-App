import { Post } from "firebase-backend";
import { Request, Response } from "express";
import { RspData } from "../../models/models";
import { StripeService } from "../../services/stripe_service";
export default new Post(async (req: Request, resp: Response) => {
  try {
    const email: string | null = req.body["email"];
    const userId: string | null = req.body["userId"];
    const stripeId: string | null = req.body["stripeId"];
    const amount: number | null = req.body["amount"];
    if (email != null && userId != null && stripeId != null && amount != null) {
      const stripeService: StripeService = new StripeService();
      const res: RspData = await stripeService.withdraw(
        email,
        stripeId,
        amount,
        userId
      );
      resp.status(res.status_code).send(res);
    } else {
      const rspData: RspData = {
        status_code: 400,
        error: {
          message: "Missin Params. Some Parameters are missing",
          reason_phrase: "Cannot execute without required params",
        },
      };
      resp.status(rspData.status_code).send(rspData);
    }
  } catch (error) {
    const rspData: RspData = {
      status_code: 400,
      error: {
        message: "An Error Occured while trying to initiate withdraw",
        reason_phrase: error,
      },
    };
    resp.status(rspData.status_code).send(rspData);
  }
});
