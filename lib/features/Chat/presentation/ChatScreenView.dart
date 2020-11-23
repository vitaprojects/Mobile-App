import 'package:flutter/material.dart';
import 'package:newpostman1/features/Chat/presentation/ChatListTile.dart';
import 'package:newpostman1/useful/globals.dart';

class ChatScreenView extends StatelessWidget {
  ChatScreenView({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chats"),
          backgroundColor: Globals.mainColor,
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ChatListTile();
          },
        ),
      ),
    );
  }
}
