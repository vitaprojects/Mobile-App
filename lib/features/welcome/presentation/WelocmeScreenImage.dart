import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/useful/globals.dart';

class WelcomeScreenImage extends StatelessWidget {
  const WelcomeScreenImage({
    this.bodyText,
    this.imageAssetName,
  });
  final String bodyText;
  final String imageAssetName;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Container(
      margin: EdgeInsets.only(
        left: blockWidth * 5,
        right: blockWidth * 5,
        bottom: blockHeight * 5,
      ),
      height: blockHeight * 80,
      // color: Colors.green,
      child: Column(
        children: [
          Expanded(
            child: Container(
              // color: Colors.red,
              alignment: Alignment.center,
              child: Image.asset(
                imageAssetName,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            height: blockHeight * 20,
            // color: Colors.yellow,
            alignment: Alignment.center,
            child: Container(
              height: blockHeight * 8,
              // color: Colors.redAccent,
              alignment: Alignment.center,
              child: AutoSizeText(
                bodyText,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                minFontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
