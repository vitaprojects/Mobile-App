import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/useful/globals.dart';

class CustomButtonToShowLocation extends StatelessWidget {
  CustomButtonToShowLocation({
    @required this.callback,
    @required this.buttonText,
  });
  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;
  final double margin = Globals.blockWidth * 5;
  final String buttonText;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: blockHeight * 5,
      //color: Colors.greenAccent,
      margin: EdgeInsets.symmetric(
        vertical: blockHeight * 2,
        horizontal: margin,
      ),
      child: RaisedButton(
        color: Colors.greenAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          10,
        )),
        padding: EdgeInsets.all(
          0,
        ),
        onPressed: () {
          callback();
        },
        child: Container(
          height: blockHeight * 5,
          // color: Colors.greenAccent,
          /*  margin: EdgeInsets.symmetric(
                                            vertical: blockHeight * 2,
                                            horizontal: margin,
                                          ), */
          alignment: Alignment.center,
          child: Container(
            height: blockHeight * 3,
            //  color: Colors.yellow,
            alignment: Alignment.center,
            child: AutoSizeText(
              "$buttonText".toUpperCase(),
              style: TextStyle(
                fontSize: 18,
              ),
              minFontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
