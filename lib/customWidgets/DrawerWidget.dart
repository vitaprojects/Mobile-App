import 'package:flutter/material.dart';

import '../globals.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key key}) : super(key: key);

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: blockHeight * 15,
          color: Colors.yellow,
          alignment: Alignment.center,
        )
      ],
    );
  }
}
