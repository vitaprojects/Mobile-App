import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';

class ChatRoomViewModel extends ChangeNotifier {
  final GlobalKey<DashChatState> chatViewKey = GlobalKey<DashChatState>();
  final ChatUser user = ChatUser(
    name: "Fayeed",
    firstName: "Fayeed",
    lastName: "Pawaskar",
    uid: "12345678",
    avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
  );

  final ChatUser otherUser = ChatUser(
    name: "Mrfatty",
    uid: "25649654",
  );

  var i = 0;
  var m = List<ChatMessage>();

  List<ChatMessage> messages = List<ChatMessage>();
  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        messages = [...messages, m[i]];

        notifyListeners();
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        chatViewKey.currentState.scrollController
          ..animateTo(
            chatViewKey.currentState.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  void onSend(ChatMessage message) async {
    print(message.toJson());
    var documentReference = Firestore.instance
        .collection('messages')
        .document(DateTime.now().millisecondsSinceEpoch.toString());

    await Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        message.toJson(),
      );
    });
  }
}
