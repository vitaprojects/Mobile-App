// library my_orj.globals;

import 'package:flutter/material.dart';

class Globals {
  static double blockHeight;
  static double blockWidth;
  static Color mainColor = Color(0xff07cb8c);

  static addBlockHeightAndWidth(double height, double width) {
    blockHeight = height;
    blockWidth = width;
  }
}
