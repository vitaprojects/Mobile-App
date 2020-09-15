import 'package:flutter/material.dart';
import 'package:newpostman1/globals.dart';

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
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}
