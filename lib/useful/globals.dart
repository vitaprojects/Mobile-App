// library my_orj.globals;

import 'package:flutter/material.dart';

class Globals {
  static double blockHeight;
  static double blockWidth;
  static Color mainColor = Color(0xff07cb8c);
  static Color bgColor = Color(0xffd8fdf1);
  static Color formFieldColor = Color(
    0xffaffde4,
  );

  static addBlockHeightAndWidth(double height, double width) {
    blockHeight = height;
    blockWidth = width;
  }
}
