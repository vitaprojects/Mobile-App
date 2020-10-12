import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/ui/HomePage.dart';
import 'package:newpostman1/ui/MyTripsWidget.dart';
import 'package:newpostman1/ui/TrackPackage.dart';
import 'package:newpostman1/ui/ViewCustomerRequest.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../globals.dart';

class ThankYouWidget extends StatelessWidget {
  ThankYouWidget({
    this.typeOfThankYou,
  });

  final int typeOfThankYou;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        20,
                      ),
                      bottomRight: Radius.circular(
                        20,
                      ))),
              margin: EdgeInsets.symmetric(
                horizontal: blockWidth * 5,
              ),
              child: Container(
                height: blockHeight * 25,
                // color: Colors.red,
                alignment: Alignment.center,
                child: Container(
                  height: blockHeight * 20,
                  // color: Colors.yellow,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.green,
                          alignment: Alignment.center,
                          child: Container(
                            height: blockHeight * 6,
                            width: blockHeight * 6,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Globals.mainColor,
                            ),
                            child: Icon(
                              Icons.done_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // color: Colors.yellow,
                          alignment: Alignment.center,
                          child: Container(
                            height: blockHeight * 8,
                            // color: Colors.orange,
                            alignment: Alignment.center,
                            child: Container(
                              height: blockHeight * 4,
                              // color: Colors.yellow,
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                "Thank you".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                minFontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Alert(
                  closeFunction: () => {},
                  context: context,
                  type: AlertType.info,
                  title: "You got a new request",
                  desc: "A customer sent you a request",
                  buttons: [
                    DialogButton(
                      color: Globals.mainColor,
                      child: Text(
                        "Check".toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Get.to(ViewCustomerRequest());
                      },
                      width: 120,
                    ),
                    DialogButton(
                      color: Colors.red,
                      child: Text(
                        "Cancel".toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    ),
                  ],
                ).show();
              },
              child: Text("show alert"),
            ),
            Container(
                height: blockHeight * 20,
                // color: Colors.yellow,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: "Thank you for using  ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "new postman",
                            style: TextStyle(
                              color: Globals.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      ],
                    )),
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        if (typeOfThankYou == 1) {
                          return Column(
                            children: [
                              Text(
                                "Your request posted successfully",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "You will get an alert when someone accept your request !",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          );
                        } else if (typeOfThankYou == 2) {
                          return Column(
                            children: [
                              Text(
                                "Your errand posted successfully",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "You will get an alert when someone accept your request !",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              Text(
                                "Your itenary posted successfully",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Watchout for customer requests !",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    // Text(
                    //   "Have a wonderful trip and keep using postman",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //   ),
                    // )
                  ],
                )),
            Container(
              height: blockHeight * 20,
              // color: Colors.green,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: blockWidth * 5,
                    ),
                    child: RaisedButton(
                      color: Globals.mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        20,
                      )),
                      onPressed: () {
                        if (typeOfThankYou == 1) {
                          Get.off(TrackPackage());
                        } else {
                          Get.off(MyTripsWidget());
                        }
                      },
                      padding: EdgeInsets.all(0),
                      child: Container(
                        height: blockHeight * 6,
                        // color: Colors.red,
                        alignment: Alignment.center,
                        child: Container(
                          height: blockHeight * 3,
                          // color: Colors.yellow,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            typeOfThankYou == 1
                                ? "view request".toUpperCase()
                                : "view itenary".toUpperCase(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            minFontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: blockHeight * 2,
                  ),
                  Container(
                    height: blockHeight * 6,
                    // color: Colors.yellow,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        print("back to home");
                        Get.offAll(HomePage());
                      },
                      child: Container(
                        width: blockWidth * 70,
                        height: blockHeight * 4,
                        // color: Colors.yellow,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          "back to home ".toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Globals.mainColor,
                            decoration: TextDecoration.underline,
                          ),
                          minFontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
