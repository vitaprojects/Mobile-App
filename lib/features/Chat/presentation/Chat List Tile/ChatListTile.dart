import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/Chat/presentation/Chat%20List%20Tile/ChatUserIcon.dart';
import 'package:newpostman1/features/Chat/presentation/Chat%20List%20Tile/NameAndChatPreview.dart';
import 'package:newpostman1/useful/globals.dart';

import 'MessageTimeAndCount.dart';

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
        height: blockHeight * 10,
        // color: Colors.greenAccent,
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              width: blockHeight * 10,
              // color: Colors.yellow,
              alignment: Alignment.center,
              child: ChatuserIcon(),
            ),
            NameAndChatPreview(),
            MessageTimeAndCount(),
          ],
        ),
      ),
    );
  }
}
