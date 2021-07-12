import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:newpostman1/features/withdraw/presentation/pages/withdraw_view_model.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

class WithdrawView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blockHeight = Globals.blockHeight;
    final blockWidth = Globals.blockWidth;
    return Scaffold(
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ViewModelBuilder<WithdrawViewModel>.reactive(
              builder: (_, model, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: blockHeight * 10 / 2,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: blockWidth * 5),
                      child: Text(
                        'Withdraw',
                        style: TextStyle(
                            color: Globals.mainColor,
                            fontSize: 16 * blockHeight / 4,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: blockWidth * 15 / 2),
                      child: Text(
                        'You can withdraw money here',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14 * blockHeight / 6.5,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    if (model.userModel != null) ...[
                      model.userModel.stripeId != null &&
                              model.userModel.stripeId != ''
                          ? GestureDetector(
                              onTap: () {
                                Logger().d(model.userModel.email);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: blockHeight * 8,
                                margin: EdgeInsets.symmetric(
                                    horizontal: blockWidth * 5,
                                    vertical: blockHeight * 5),
                                decoration: BoxDecoration(
                                    color: Globals.mainColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  'Withdraw'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: blockHeight * 3,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                // Logger().d(model.userModel.email);
                                model.createStripeAccount();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: blockHeight * 8,
                                margin: EdgeInsets.symmetric(
                                    horizontal: blockWidth * 5,
                                    vertical: blockHeight * 5),
                                decoration: BoxDecoration(
                                    color: Globals.mainColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: model.isBusy
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'Create Stripe account'.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: blockHeight * 2.5,
                                            fontWeight: FontWeight.w600),
                                      ),
                              )),
                    ]
                  ],
                );
              },
              viewModelBuilder: () => locator<WithdrawViewModel>())),
    );
  }
}
