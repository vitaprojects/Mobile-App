import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../globals.dart';

class SenderInformationCard extends StatelessWidget {
  SenderInformationCard({
    this.isSender,
  });
  final bool isSender;

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: blockHeight * 16,
      // color: Colors.orange,
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: blockHeight * 4,
            // color: Colors.yellow,
            alignment: Alignment.centerLeft,
            child: Container(
              height: blockHeight * 2.5,
              // color: Colors.redAccent,
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                isSender == true ? "Sender Info" : "Receiver Info",
                style: TextStyle(
                  fontSize: 16,
                  color: Globals.mainColor,
                  fontWeight: FontWeight.bold,
                ),
                minFontSize: 12,
              ),
            ),
          ),
          Container(
            height: blockHeight * 4,
            // color: Colors.yellow,
            alignment: Alignment.centerLeft,
            child: Container(
              height: blockHeight * 2.5,
              // color: Colors.redAccent,
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                "Michael danu",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                minFontSize: 12,
              ),
            ),
          ),
          Container(
            height: blockHeight * 4,
            // color: Colors.yellow,
            alignment: Alignment.centerLeft,
            child: Container(
              height: blockHeight * 2.5,
              // color: Colors.redAccent,
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                "0771234567",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                minFontSize: 12,
              ),
            ),
          ),
          Container(
            height: blockHeight * 4,
            // color: Colors.yellow,
            alignment: Alignment.centerLeft,
            child: Container(
              height: blockHeight * 2.5,
              // color: Colors.redAccent,
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                "abcd dfke /dsds",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                minFontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
