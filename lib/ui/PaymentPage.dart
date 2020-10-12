import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/customWidgets/PaymentSelectionButton.dart';
import 'package:newpostman1/customWidgets/SendPackage/PackageListedMessage.dart';

import '../globals.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  double margin;

  @override
  Widget build(BuildContext context) {
    margin = blockWidth * 5;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: blockHeight * 5,
              ),
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
              SizedBox(
                height: blockHeight * 5,
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
                            "payment methods".toUpperCase(),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PaymentSelectionButton(
                                assetUrl: "assets/images/card.jpg",
                              ),
                              PaymentSelectionButton(
                                assetUrl: "assets/images/paystack.png",
                              ),
                              PaymentSelectionButton(
                                assetUrl: "assets/images/card.jpg",
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: blockHeight * 2,
                      ),
                      Container(
                        height: blockHeight * 5,
                        // color: Colors.greenAccent,
                        alignment: Alignment.centerLeft,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: blockHeight * 3,
                          // color: Colors.redAccent,
                          child: AutoSizeText(
                            "payment details".toUpperCase(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            minFontSize: 14,
                          ),
                        ),
                      ),
                      FormBuilderTextField(
                        attribute: "name",
                        decoration: InputDecoration(
                            labelText: "Cardholder Name",
                            prefixIcon: Icon(
                              Icons.person,
                            )),
                      ),
                      SizedBox(
                        height: blockHeight * 2,
                      ),
                      FormBuilderTextField(
                        attribute: "number",
                        decoration: InputDecoration(
                            labelText: "Card Number",
                            prefixIcon: Icon(
                              Icons.credit_card,
                            )),
                      ),
                      SizedBox(
                        height: blockHeight * 2,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: FormBuilderDateTimePicker(
                              attribute: "date",
                              decoration: InputDecoration(
                                  labelText: "Date",
                                  prefixIcon: Icon(
                                    Icons.date_range,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: blockWidth * 5,
                          ),
                          Expanded(
                            child: FormBuilderTextField(
                              attribute: "cvv",
                              decoration: InputDecoration(
                                labelText: "CVV",
                                // prefixIcon: Icon(
                                //   Icons.se,
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: blockHeight * 5,
                      )
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
                  buttonText: "Confirm payment",
                  ontapFun: () {
                    Get.to(PackageListedMessage());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
