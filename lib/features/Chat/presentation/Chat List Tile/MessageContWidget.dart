import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/useful/globals.dart';

class MessageCount extends StatelessWidget {
  MessageCount({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: blockHeight * 3,
      // color: Colors.orangeAccent,
      alignment: Alignment.center,
      child: Container(
        height: blockHeight * 2.5,
        width: blockHeight * 2.5,
        // color: Colors.yellow,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: AutoSizeText(
          "9+",
          style: TextStyle(
            fontSize: 10,
            color: Colors.white70,
          ),
          minFontSize: 10,
        ),
      ),
    );
  }
}
