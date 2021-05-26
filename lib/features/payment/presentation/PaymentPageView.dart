import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/customWidgets/PaymentSelectionButton.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/features/payment/presentation/PaymentPageViewModel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

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

  confirmPaymentAlert() {
    Alert(
      context: context,
      type: AlertType.info,
      title: "CONFIRM PAYMENT",
      desc: "Please confirm the payment of \$22",
      buttons: [
        DialogButton(
          child: Text(
            "confirm".toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            Get.back();

            OrderModel orderModel = OrderModel(
              postmanFee: widget.requestModel
                  .postmanOffer, //we dont any info about these they are in the errand document
              pacakgeDocId: widget.requestModel.packageDocID,
              postmanEmail: widget.requestModel.postman,
              statusOftheOrder:
                  0, //in the beggining of te order the status is 0
              tipAmount: 0, //in the begniing we are not paying the tip
              type: 1, //because this is a order of a package
              userEmail: Hive.box('user').get('email').toLowerCase(),
            );

            //    firebaseFirestore.collection('orders').add(orderModel.toJson());

            Future.delayed(Duration(seconds: 1)).then((value) {
              Get.snackbar("Payment successful", "Your payment was successfuly",
                  icon: Icon(
                    Icons.done,
                    color: Colors.green,
                  ));
            });
          },
          color: Globals.mainColor,
        ),
        DialogButton(
          child: Text(
            "cancel".toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
        )
      ],
    ).show();
  }

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
                            attribute: "total",
                            labelText: "Total",
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
                                    PaymentSelectionButton(
                                      callback: () {
                                        model.payUsingStripe();
                                      },
                                      assetUrl: "assets/images/stripe.jpg",
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
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    Container(
                      height: blockHeight * 10,
                      // color: Colors.green,
                      alignment: Alignment.center,
                      child: FormButton(
                        buttonText: "pay",
                        ontapFun: () {
                          // Get.to(PackageListedMessage());
                          confirmPaymentAlert();
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
