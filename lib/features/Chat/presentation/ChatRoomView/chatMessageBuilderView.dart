import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

import 'chatMessageBuilderViewModel.dart';

class ChatmessagesBuilderView extends StatelessWidget {
  final UserModel userModel;
  final authService = locator<AuthenticationService>();

  ChatmessagesBuilderView({Key key, @required this.userModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatMessagesBuilderViewmodel>.reactive(
      builder: (context, model, widget) {
        if (model.isBusy) {
          CircularProgressIndicator();
        }
        print(model.listModels == null
            ? 'Null'
            : 'has data ${model.listModels.length}');

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                key: model.chatViewKey,
                controller: model.scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount:
                    model.listModels != null ? model.listModels.length ?? 0 : 0,
                itemBuilder: (context, index) {
                  ///!checking for the users identity this can be done in the view model too
                  if (model.listModels[index].senderEmail ==
                          FirebaseAuth.instance.currentUser.email ||
                      model.listModels[index].receiveremail ==
                          FirebaseAuth.instance.currentUser.email) {
                    if (model.listModels[index].senderEmail ==
                            userModel.email ||
                        model.listModels[index].receiveremail ==
                            userModel.email) {
                      if (model.listModels[index].isImage == true) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          alignment: model.listModels[index].senderEmail ==
                                  FirebaseAuth.instance.currentUser.email
                              ? Alignment.centerRight
                              : Alignment.bottomLeft,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              progressIndicatorBuilder:
                                  (context, url, progress) {
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
                      return model.listModels[index].senderEmail ==
                              model.user.email
                          ? Bubble(
                              margin: BubbleEdges.only(top: 10),
                              alignment: Alignment.centerRight,
                              nip: BubbleNip.rightTop,
                              color: Color.fromRGBO(225, 255, 199, 1.0),
                              child: Text(model.listModels[index].message,
                                  textAlign: TextAlign.right),
                            )
                          : Bubble(
                              margin: BubbleEdges.only(top: 10),
                              alignment: Alignment.centerLeft,
                              nip: BubbleNip.leftTop,
                              child: Text(model.listModels[index].message),
                            );
                    } else
                      return Offstage();
                  } else {
                    return Offstage();
                  }
                },
              ),
            ),
            // SizedBox(height: 5,)
          ],
        );
      },
      viewModelBuilder: () => ChatMessagesBuilderViewmodel(),
    );
  }
}
