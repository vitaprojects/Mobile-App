import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newpostman1/useful/globals.dart';

class ChatListTile extends StatelessWidget {
  ChatListTile({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
        vertical: blockHeight / 2,
      ),
      child: Container(
        height: blockHeight * 8,
        // color: Colors.greenAccent,
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              width: blockHeight * 8,
              // color: Colors.yellow,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 6,
                width: blockHeight * 6,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/user.png",
                  height: blockHeight * 6,
                  width: blockHeight * 6,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: blockWidth * 4,
                ),
                // color: Colors.grey,
                alignment: Alignment.centerLeft,
                child: Text(
                  "dulajmichael@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              width: blockHeight * 8,
              // color: Colors.yellow,
              alignment: Alignment.center,
              child: Text("5"),
            )
          ],
        ),
      ),
    );
  }
}
