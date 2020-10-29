import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../useful/globals.dart';

class TitleWidgetInDrawer extends StatelessWidget {
  TitleWidgetInDrawer({
    this.margin,
    this.title,
  });

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final double margin;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: blockHeight * 6,
      // color: Colors.yellow,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(
        horizontal: margin,
      ),
      child: Container(
        height: blockHeight * 3.5,
        // color: Colors.redAccent,
        alignment: Alignment.centerLeft,
        child: AutoSizeText(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Globals.mainColor,
            fontWeight: FontWeight.bold,
          ),
          minFontSize: 15,
        ),
      ),
    );
  }
}
