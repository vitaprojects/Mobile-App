import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../globals.dart';

class EarningSectionWidget extends StatelessWidget {
  const EarningSectionWidget({
    this.title,
    this.earning,
  });
  final String title;
  final String earning;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Container(
      height: blockHeight * 7,
      // color: Colors.redAccent,
      alignment: Alignment.center,
      child: Container(
        height: blockHeight * 3,
        // color: Colors.grey,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: blockWidth * 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              minFontSize: 14,
            ),
            AutoSizeText(
              earning,
              style: TextStyle(
                fontSize: 18,
              ),
              minFontSize: 14,
            )
          ],
        ),
      ),
    );
  }
}
