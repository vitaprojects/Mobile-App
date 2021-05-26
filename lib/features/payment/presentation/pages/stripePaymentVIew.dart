import 'package:auto_size_text/auto_size_text.dart';
// import 'package:credit_card/flutter_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:logger/logger.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/payment/presentation/pages/PaymentPageViewModel.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

class StripePaymentView extends StatelessWidget {
  final RequestModel requestModel;

  const StripePaymentView({Key key, @required this.requestModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ViewModelBuilder<PaymentPageViewModel>.reactive(
          builder: (context, model, child) {
            return Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: kToolbarHeight, left: blockWidth * 6),
                    // height: blockHeight * 5,
                    // color: Colors.greenAccent,
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      "Payment",
                      style: TextStyle(
                        fontSize: 25,
                        color: Globals.mainColor,
                        fontWeight: FontWeight.w700,
                      ),
                      minFontSize: 18,
                    )),
                Container(
                    margin: EdgeInsets.only(top: 10, left: blockWidth * 6),
                    // height: blockHeight * 5,
                    // color: Colors.greenAccent,
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      "Add your card information and proceed to pay",
                      style: TextStyle(
                        fontSize: 12,
                        // color: Globals.mainColor,
                        // fontWeight: FontWeight.w700,
                      ),
                      minFontSize: 16,
                    )),
                CreditCardWidget(
                  cardNumber: model.cardNumber,
                  expiryDate: model.expiryDate,
                  cardHolderName: model.cardHolderName,
                  cvvCode: '',
                  showBackView:
                      false, //true when you want to show cvv(back) view
                ),
                CreditCardForm(
                  formKey: model.formKey,
                  // key: model.formKey,
                  onCreditCardModelChange: (data) {
                    model.updateCardChangeInfo(data);
                  },
                ),
                Container(
                  height: blockHeight * 10,
                  // color: Colors.green,
                  alignment: Alignment.center,
                  child: FormButton(
                    buttonText: "pay",
                    ontapFun: () {
                      // Get.to(StripePaymentView());
                      // confirmPaymentAlert();
                      // model.confirmPaymentAlert(requestModel);
                      Logger().w(model.tipTextController.text);
                    },
                  ),
                )
              ],
            );
          },
          viewModelBuilder: () => PaymentPageViewModel(),
        ),
      ),
    );
  }
}
