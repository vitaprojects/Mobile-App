import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';

class TotalEarningsAppBar extends StatelessWidget {
  TotalEarningsAppBar({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  double margin;

  @override
  Widget build(BuildContext context) {
    margin = blockWidth * 5;
    return Container(
      height: blockHeight * 20,
      color: Globals.mainColor,
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: blockHeight * 8,
            // color: Colors.yellow,
            alignment: Alignment.center,
            child: Container(
              height: blockHeight * 4,
              // color: Colors.green,
              alignment: Alignment.center,
              child: AutoSizeText(
                "Earnings".toUpperCase(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                minFontSize: 18,
              ),
            ),
          ),
          Container(
            height: blockHeight * 12,
            // color: Colors.orange,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: blockHeight * 5,
                  // color: Colors.yellow,
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    "\$0.00",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    minFontSize: 18,
                  ),
                ),
                Container(
                  height: blockHeight * 5,
                  // color: Colors.yellow,
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    "Total Earned",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      // fontWeight:
                    ),
                    minFontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
