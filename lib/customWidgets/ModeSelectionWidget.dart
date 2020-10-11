//this widget is created when the user wants to select whether post iternary or send a package
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/globals.dart';
import 'package:newpostman1/ui/HomePage.dart';
import 'package:newpostman1/ui/PostYourErrand.dart';
import 'package:newpostman1/ui/PostYourItenary.dart';
import 'package:newpostman1/ui/SendPackage.dart';
// import '';

class ModeSelectionWidget extends StatelessWidget {
  const ModeSelectionWidget({
    this.assetName,
    this.bodyText,
    this.buttonText,
    // this.methodInButton,
    this.pageNum,
  });
  final String assetName;
  final String bodyText;
  final String buttonText;
  // final Function methodInButton;
  // final bool isFirstPage;
  final int pageNum;

  // final SnackbarService

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Container(
      height: blockHeight * 85,
      // child: child,
      // color: Colors.green,
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Container(
                height: blockHeight * 65,
                // color: Colors.orange,
                alignment: Alignment.center,
                child: Image.asset(
                  assetName,
                  fit: BoxFit.contain,
                  height: blockHeight * 65,
                ),
              ),
              Align(
                alignment: (pageNum % 2 == 0)
                    ? Alignment.bottomCenter
                    : Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: blockWidth * 5,
                  ),
                  height: blockHeight * 15,
                  // color: Colors.green,
                  alignment: Alignment.center,
                  child: Container(
                    height: blockHeight * 10,
                    // color: Colors.yellow,
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      bodyText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      minFontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          )),
          Container(
            height: blockHeight * 20,
            // color: Colors.yellow,
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (pageNum == 0) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: blockWidth * 5,
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                            25,
                          )),
                          color: Globals.mainColor,
                          padding: EdgeInsets.all(
                            0,
                          ),
                          onPressed: () {
                            // Get.to(PostYourItenary());
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return PostYourItenary();
                            }));
                          },
                          child: Container(
                            height: blockHeight * 6,
                            // color: Colors.green,
                            alignment: Alignment.center,
                            child: Container(
                              height: blockHeight * 4,
                              // color: Colors.redAccent,
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                buttonText.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                minFontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: blockHeight * 1,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: blockWidth * 5,
                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                            25,
                          )),
                          color: Globals.mainColor,
                          padding: EdgeInsets.all(
                            0,
                          ),
                          onPressed: () {
                            Get.snackbar("You are now available",
                                "You are now available for local errands",
                                backgroundColor: Colors.white,
                                icon: Icon(
                                  Icons.done,
                                  color: Colors.green,
                                ));
                          },
                          child: Container(
                            height: blockHeight * 6,
                            // color: Colors.green,
                            alignment: Alignment.center,
                            child: Container(
                              height: blockHeight * 4,
                              // color: Colors.redAccent,
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                "run local errands".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                minFontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: blockWidth * 5,
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        25,
                      )),
                      color: Globals.mainColor,
                      padding: EdgeInsets.all(
                        0,
                      ),
                      onPressed: () {
                        if (pageNum == 1) {
                          print("go to send package");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return SendPackage();
                          }));
                        } else {
                          print("go to errand page");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return PostYourErrand();
                          }));
                        }
                      },
                      child: Container(
                        height: blockHeight * 6,
                        // color: Colors.green,
                        alignment: Alignment.center,
                        child: Container(
                          height: blockHeight * 4,
                          // color: Colors.redAccent,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            buttonText.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            minFontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
