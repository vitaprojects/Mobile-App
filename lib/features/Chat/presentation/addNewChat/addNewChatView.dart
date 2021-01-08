import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/Chat/presentation/ChatRoomView/newChatRoomView.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

import 'addNewChatViewModel.dart';

class AddNewChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 30,
            ),
          ),
          title: Text(
            'New Message',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ViewModelBuilder<AddNewChatViewmodel>.reactive(
            builder: (context, model, widget) {
              print(model.userList == null ? '*** empty' : '*** not empty');
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount:
                    model.userList != null ? model.userList.length ?? 0 : 0,
                itemBuilder: (BuildContext context, int index) {
                  return model.userList[index].email !=
                          FirebaseAuth.instance.currentUser.email
                      ? ListTile(
                          onTap: () {
                            // model.isOk();
                            Get.off(NewChatRoomView(
                              userModel: model.userList[index],
                            ));
                          },
                          title: Text(model.userList[index].fname),
                          subtitle: Text(model.userList[index].lname),
                          leading: CircleAvatar(
                            backgroundColor: Globals.bgColor,
                            child: Icon(Icons.supervised_user_circle),
                          ),
                        )
                      : Offstage();
                },
              );
            },
            viewModelBuilder: () => AddNewChatViewmodel()));
  }
}
