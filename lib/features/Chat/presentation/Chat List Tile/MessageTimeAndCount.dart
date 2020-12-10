import 'package:flutter/material.dart';
import 'package:newpostman1/features/Chat/presentation/Chat%20List%20Tile/MessageContWidget.dart';
import 'package:newpostman1/features/Chat/presentation/Chat%20List%20Tile/TimeWidget.dart';
import 'package:newpostman1/useful/globals.dart';

class MessageTimeAndCount extends StatelessWidget {
  //this widget will display the message sent or received time and the number of new messges the user has
  MessageTimeAndCount({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: blockHeight * 8,
      // color: Colors.yellow,
      alignment: Alignment.center,
      child: Container(
        height: blockHeight * 6,
        // color: Colors.redAccent,
        width: blockHeight * 6,
        alignment: Alignment.center,
        child: Column(
          children: [
            TimeWidget(),
            MessageCount(),
          ],
        ),
      ),
    );
  }
}
