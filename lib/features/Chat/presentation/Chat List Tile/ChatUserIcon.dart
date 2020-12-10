import 'package:flutter/material.dart';
import 'package:newpostman1/useful/globals.dart';

class ChatuserIcon extends StatelessWidget {
  ChatuserIcon({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: blockHeight * 6,
        width: blockHeight * 6,
        // color: Colors.amber,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              height: blockHeight * 6,
              width: blockHeight * 6,
              // color: Colors.greenAccent,
            ),
            Image.asset(
              "assets/images/user.png",
              height: blockHeight * 6,
              width: blockHeight * 6,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: blockHeight * 2,
                width: blockHeight * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
            )
          ],
        ));
  }
}
