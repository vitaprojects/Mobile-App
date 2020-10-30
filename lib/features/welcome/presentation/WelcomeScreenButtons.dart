import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/authentication/presentation/LoginPage.dart';
import 'package:newpostman1/features/authentication/presentation/SignUpView.dart';

import '../../../useful/globals.dart';

class WelcomeScreensButtons extends StatelessWidget {
  const WelcomeScreensButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    if (Globals.blockHeight != null && Globals.blockWidth != null) {
      return Container(
        height: blockHeight * 12,
        decoration: BoxDecoration(
          color: Globals.mainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              20,
            ),
            topRight: Radius.circular(
              20,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Container(
          height: blockHeight * 6,
          // color: Colors.blue,
          margin: EdgeInsets.symmetric(
            horizontal: blockWidth * 5,
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: OutlineButton(
                  highlightedBorderColor: Colors.green,
                  borderSide:
                      BorderSide(color: Colors.white, width: blockWidth / 2),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  padding: EdgeInsets.all(
                    0,
                  ),
                  onPressed: () {
                    Get.to(LoginPage());
                  },
                  child: Container(
                    // color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Container(
                      height: blockHeight * 3,
                      // color: Colors.amberAccent,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "Log in".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                        ),
                        minFontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: blockWidth * 6,
              ),
              Expanded(
                child: OutlineButton(
                  highlightedBorderColor: Colors.green,
                  borderSide:
                      BorderSide(color: Colors.white, width: blockWidth / 2),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  padding: EdgeInsets.all(
                    0,
                  ),
                  onPressed: () {
                    Get.to(SignUpView());
                  },
                  child: Container(
                    // color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Container(
                      height: blockHeight * 3,
                      // color: Colors.amberAccent,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "sign up".toUpperCase(),
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                        ),
                        minFontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
