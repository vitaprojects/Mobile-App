import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({
    Key key,
    this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.marginLeft = 10,
    this.marginRight = 10,
    this.marginTop = 0,
    this.marginBottom = 0,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final double marginBottom;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: EdgeInsets.only(
          left: marginLeft,
          top: marginTop,
          bottom: marginBottom,
          right: marginRight),
      child: Text(
        text ?? 'Withdraw',
        style:
            TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
      ),
    );
  }
}
