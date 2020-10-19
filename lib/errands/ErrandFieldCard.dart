import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class ErrandFieldCard extends StatelessWidget {
  ErrandFieldCard({this.fieldTitle, this.bodyText});
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final String fieldTitle;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    double margin = blockWidth * 5;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: margin,
      ),
      // height: blockHeight * 8,
      // color: Colors.red,
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: blockHeight * 3,
            // color: Colors.orange,
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              fieldTitle,
              style: TextStyle(
                fontSize: 20,
              ),
              minFontSize: 14,
            ),
          ),
          Divider(
            height: blockHeight / 2,
            thickness: blockHeight / 4,
          ),
          Container(
            height: blockHeight * 5,
            // color: Colors.yellow,
            alignment: Alignment.centerLeft,
            child: Container(
              height: blockHeight * 4,
              // color: Colors.orange,
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                bodyText,
                style: TextStyle(
                  fontSize: 25,
                ),
                minFontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
