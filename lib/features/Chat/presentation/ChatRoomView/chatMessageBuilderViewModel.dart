import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/Chat/data/chatModel.dart';
import 'package:newpostman1/features/Chat/data/chat_service.dart';
import 'package:newpostman1/features/Chat/presentation/ChatRoomView/chatMessageBuilderView.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

class ChatMessagesBuilderViewmodel extends StreamViewModel<List<ChatModel>> {
  final chatservice = locator<ChatService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  // User user=  authenticationService.getCurrentUser();
  ///*retruns the current user
  User get user => FirebaseAuth.instance.currentUser;

  ///the chats within the document
  List<ChatModel> get listModels => data;

  @override
  Stream<List<ChatModel>> get stream => chatservice.getMessages;

  String title = 'gtfo';

  @override
  void initialise() {
    super.initialise();
  }

  ///*this `[showMessage]` returns either the chat or a message widget to both ends
  Widget showMessage(
      ChatMessagesBuilderViewmodel model, int index, UserModel userModel) {
    if (model.listModels[index].senderEmail ==
            FirebaseAuth.instance.currentUser.email ||
        model.listModels[index].receiveremail ==
            FirebaseAuth.instance.currentUser.email) {
      if (model.listModels[index].senderEmail == userModel.email ||
          model.listModels[index].receiveremail == userModel.email) {
        if (model.listModels[index].isImage == true) {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            alignment: model.listModels[index].senderEmail ==
                    FirebaseAuth.instance.currentUser.email
                ? Alignment.centerRight
                : Alignment.bottomLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) {
                  return Center(
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator()));
                },
                width: 150,
                height: 150,
                alignment: Alignment.centerRight,
                imageUrl: model.listModels[index].message,
                fit: BoxFit.cover,
              ),
            ),
          );
        }
        return model.listModels[index].senderEmail == model.user.email
            ? Bubble(
                margin: BubbleEdges.only(top: 10, bottom: 5),
                alignment: Alignment.centerRight,
                nip: BubbleNip.rightTop,
                color: Color.fromRGBO(225, 255, 199, 1.0),
                child: Text(model.listModels[index].message,
                    textAlign: TextAlign.right),
              )
            : Bubble(
                margin: BubbleEdges.only(top: 10, bottom: 5),
                alignment: Alignment.centerLeft,
                nip: BubbleNip.leftTop,
                child: Text(model.listModels[index].message),
              );
      } else
        return Offstage();
    } else {
      return Offstage();
    }
  }
}
