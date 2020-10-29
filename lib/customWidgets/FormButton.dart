import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../useful/globals.dart';

class FormButton extends StatelessWidget {
  FormButton({
    this.ontapFun,
    this.buttonText,
  });
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final VoidCallback ontapFun;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          // Get.toS(ThankYouWidget());
          // Get.to(SendPackageSecondPage());
          ontapFun();
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
              buttonText.toUpperCase(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              minFontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
