import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/customWidgets/PaymentSelectionButton.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/payment/presentation/pages/PaymentPageViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../useful/globals.dart';

class PaymentPageView extends StatefulWidget {
  PaymentPageView({
    @required this.requestModel,
  });
  final RequestModel requestModel;

  @override
  _PaymentPageViewState createState() => _PaymentPageViewState();
}

class _PaymentPageViewState extends State<PaymentPageView> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  double margin;

  @override
  Widget build(BuildContext context) {
    margin = blockWidth * 5;
    return ViewModelBuilder<PaymentPageViewModel>.reactive(
        onModelReady: (model) {
          model.initialiseData(widget.requestModel);
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   height: blockHeight * 5,
                    // ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: margin,
                      ),
                      height: blockHeight * 10,
                      // color: Colors.redAccent,
                      alignment: Alignment.center,
                      child: Container(
                          height: blockHeight * 5,
                          // color: Colors.greenAccent,
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            "Confirm order and pay",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                            minFontSize: 18,
                          )),
                    ),
                    Container(
                      height: blockHeight * 6,
                      // color: Colors.yellowAccent,
                      margin: EdgeInsets.symmetric(
                        horizontal: margin,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: blockHeight * 3,
                          // color: Colors.greenAccent,
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            "Please make the payment to continue",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                            minFontSize: 14,
                          )),
                    ),

                    Container(
                      // color: Colors.red,
                      // height: blockHeight * 16,
                      margin: EdgeInsets.symmetric(
                        horizontal: blockWidth * 5,
                        vertical: blockHeight,
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          CustomInputField(
                            textEditingController: model.amountTextController,
                            attribute: "payment",
                            labelText: "Amount Due",
                            readOnly: true,
                            // initalText: "100.00",
                          ),
                          SizedBox(
                            height: blockHeight,
                          ),
                          CustomInputField(
                            textEditingController: model.tipTextController,
                            attribute: "tip",
                            labelText: "Tip",
                          ),
                          SizedBox(
                            height: blockHeight,
                          ),
                          CustomInputField(
                            readOnly: true,
                            textEditingController:
                                model.totalamountTextController,
                            attribute: "subtotal",
                            labelText: "Sub Total",
                          ),
                        ],
                      ),
                    ),

                    Card(
                      elevation: 10,
                      margin: EdgeInsets.symmetric(
                        horizontal: margin,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: blockWidth * 2,
                        ),

                        // height: blockHeight * 50,
                        // color: Colors.redAccent,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              height: blockHeight * 5,
                              // color: Colors.greenAccent,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: blockHeight * 3,
                                // color: Colors.redAccent,
                                child: AutoSizeText(
                                  "Chekout using".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  minFontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: blockHeight * 2,
                            ),
                            Container(
                              height: blockHeight * 10,
                              // color: Colors.blueAccent,
                              alignment: Alignment.center,
                              child: Container(
                                height: blockHeight * 7,
                                // color: Colors.yellow,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // PaymentSelectionButton(
                                    //   callback: () {
                                    //     model.payUsingPaypal();
                                    //   },
                                    //   assetUrl: "assets/images/paypal.png",
                                    // ),
                                    // PaymentSelectionButton(
                                    //   callback: () {
                                    //     model.payUsingPayStack(context);
                                    //   },
                                    //   assetUrl: "assets/images/paystack.png",
                                    // ),
                                    // PaymentSelectionButton(
                                    //   callback: null,
                                    //   assetUrl: "assets/images/stripe.jpg",
                                    // ),
                                    Container(
                                      width: blockWidth * 25,
                                      // color: Colors.greenAccent,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: blockWidth * 2,
                                          vertical: blockHeight),
                                      child: SizedBox.expand(
                                        child: Container(
                                          // color: Colors.orange,
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            "assets/images/stripe.jpg",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: blockHeight * 2,
                            ),
                            // Container(
                            //   height: blockHeight * 5,
                            //   // color: Colors.greenAccent,
                            //   alignment: Alignment.centerLeft,
                            //   child: Container(
                            //     alignment: Alignment.centerLeft,
                            //     height: blockHeight * 3,
                            //     // color: Colors.redAccent,
                            //     child: AutoSizeText(
                            //       "payment details".toUpperCase(),
                            //       style: TextStyle(
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //       minFontSize: 14,
                            //     ),
                            //   ),
                            // ),
                            // FormBuilderTextField(
                            //   attribute: "name",
                            //   decoration: InputDecoration(
                            //       labelText: "Cardholder Name",
                            //       prefixIcon: Icon(
                            //         Icons.person,
                            //       )),
                            // ),
                            // SizedBox(
                            //   height: blockHeight * 2,
                            // ),
                            // FormBuilderTextField(
                            //   attribute: "number",
                            //   decoration: InputDecoration(
                            //       labelText: "Card Number",
                            //       prefixIcon: Icon(
                            //         Icons.credit_card,
                            //       )),
                            // ),
                            // SizedBox(
                            //   height: blockHeight * 2,
                            // ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: FormBuilderDateTimePicker(
                            //         attribute: "date",
                            //         decoration: InputDecoration(
                            //             labelText: "Date",
                            //             prefixIcon: Icon(
                            //               Icons.date_range,
                            //             )),
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: blockWidth * 5,
                            //     ),
                            //     Expanded(
                            //       child: FormBuilderTextField(
                            //         attribute: "cvv",
                            //         decoration: InputDecoration(
                            //           labelText: "CVV",
                            //           // prefixIcon: Icon(
                            //           //   Icons.se,
                            //           // ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
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
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    Container(
                      height: blockHeight * 10,
                      // color: Colors.green,
                      alignment: Alignment.center,

                      child: FormButton(
                        buttonText: "pay",
                        isBusy: model.isBusy,
                        ontapFun: () {
                          // Get.to(StripePaymentView(
                          //   requestModel: widget.requestModel,
                          // ));
                          // confirmPaymentAlert();
                          model.confirmPaymentAlert(widget.requestModel);
                          // Logger().w(model.tipTextController.text);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => PaymentPageViewModel());
  }
}
