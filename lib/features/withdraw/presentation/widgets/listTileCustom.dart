import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/textCustom.dart';
import 'package:newpostman1/useful/globals.dart';

class ListTileCustom extends StatelessWidget {
  const ListTileCustom({
    Key key,
    this.mainText,
    this.secondaryText,
    this.marginTop,
    this.isError = false,
  }) : super(key: key);
  final String mainText;
  final String secondaryText;
  final double marginTop;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isError
              ? Colors.red.withOpacity(.25)
              : Globals.mainColor.withOpacity(.25),
          borderRadius: BorderRadius.circular(5)),
      height: blockHeight * 30 / 3,
      margin: EdgeInsets.only(
          left: blockWidth * 25 / 5,
          right: blockWidth * 25 / 5,
          top: marginTop ?? 25),
      child: FittedBox(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextCustom(
              marginRight: 5,
              text: mainText ?? 'Stripe Account Id:',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            TextCustom(
              marginLeft: 0,
              fontSize: 16,
              text: secondaryText ?? 'Not Determined',
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
