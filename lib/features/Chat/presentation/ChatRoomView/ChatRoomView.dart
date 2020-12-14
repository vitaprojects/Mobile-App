import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpostman1/features/Chat/presentation/ChatRoomView/ChatRoomViewModel.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

class ChatRoomView extends StatelessWidget {
  ChatRoomView({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatRoomViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Chat"),
                backgroundColor: Globals.mainColor,
              ),
              body: StreamBuilder(
                  stream: Firestore.instance.collection('messages').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                      );
                    } else {
                      List<DocumentSnapshot> items = snapshot.data.documents;
                      var messages = items
                          .map((i) => ChatMessage.fromJson(i.data()))
                          .toList();
                      return DashChat(
                        key: model.chatViewKey,
                        inverted: false,
                        onSend: model.onSend,
                        sendOnEnter: true,
                        textInputAction: TextInputAction.send,
                        user: model.user,
                        inputDecoration: InputDecoration.collapsed(
                            hintText: "Add message here..."),
                        dateFormat: DateFormat('yyyy-MMM-dd'),
                        timeFormat: DateFormat('HH:mm'),
                        messages: messages,
                        showUserAvatar: false,
                        showAvatarForEveryMessage: false,
                        scrollToBottom: true,
                        onPressAvatar: (ChatUser user) {
                          print("OnPressAvatar: ${user.name}");
                        },
                        onLongPressAvatar: (ChatUser user) {
                          print("OnLongPressAvatar: ${user.name}");
                        },
                        inputMaxLines: 5,
                        messageContainerPadding:
                            EdgeInsets.only(left: 5.0, right: 5.0),
                        alwaysShowSend: true,
                        inputTextStyle: TextStyle(fontSize: 16.0),
                        inputContainerStyle: BoxDecoration(
                          border: Border.all(width: 0.0),
                          color: Colors.white,
                        ),
                        onQuickReply: (Reply reply) {
                          // setState(() {
                          //   messages.add(ChatMessage(
                          //       text: reply.value,
                          //       createdAt: DateTime.now(),
                          //       user: user));

                          //   messages = [...messages];
                          // });

                          Timer(Duration(milliseconds: 300), () {
                            model.chatViewKey.currentState.scrollController
                              ..animateTo(
                                model.chatViewKey.currentState.scrollController
                                    .position.maxScrollExtent,
                                curve: Curves.easeOut,
                                duration: const Duration(milliseconds: 300),
                              );

                            if (model.i == 0) {
                              model.systemMessage();
                              Timer(Duration(milliseconds: 600), () {
                                model.systemMessage();
                              });
                            } else {
                              model.systemMessage();
                            }
                          });
                        },
                        onLoadEarlier: () {
                          print("laoding...");
                        },
                        shouldShowLoadEarlier: false,
                        showTraillingBeforeSend: true,
                        trailing: <Widget>[
                          IconButton(
                            icon: Icon(Icons.photo),
                            onPressed: () async {
                              File result = await ImagePicker.pickImage(
                                source: ImageSource.gallery,
                                imageQuality: 80,
                                maxHeight: 400,
                                maxWidth: 400,
                              );

                              if (result != null) {
                                final StorageReference storageRef =
                                    FirebaseStorage.instance
                                        .ref()
                                        .child("chat_images");

                                StorageUploadTask uploadTask =
                                    storageRef.putFile(
                                  result,
                                  StorageMetadata(
                                    contentType: 'image/jpg',
                                  ),
                                );
                                StorageTaskSnapshot download =
                                    await uploadTask.onComplete;

                                String url =
                                    await download.ref.getDownloadURL();

                                ChatMessage message = ChatMessage(
                                    text: "", user: model.user, image: url);

                                var documentReference = Firestore.instance
                                    .collection('messages')
                                    .document(DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString());

                                Firestore.instance
                                    .runTransaction((transaction) async {
                                  await transaction.set(
                                    documentReference,
                                    message.toJson(),
                                  );
                                });
                              }
                            },
                          )
                        ],
                      );
                    }
                  }),
            ),
          );
        },
        viewModelBuilder: () => ChatRoomViewModel());
  }
}
