import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/Chat/presentation/ChatRoomView/newChatRommViewModel.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

class ChatMessageWidget extends StatelessWidget {
  final UserModel userModel;
  const ChatMessageWidget({
    Key key,
    this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewChatRoomViewModel>.reactive(
        builder: (context, model, child) {
          return Container(
            height: Get.context.height * .06,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.lightBlue[100].withOpacity(.5),
                borderRadius: BorderRadius.circular(20)),
            // alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 5, right: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 10),
                    child: TextField(
                      controller: model.messageController,
                      expands: true,
                      dragStartBehavior: DragStartBehavior.start,
                      onChanged: (value) {},
                      scrollPhysics: BouncingScrollPhysics(),
                      scrollPadding: EdgeInsets.all(5),
                      minLines: null,
                      maxLines: null,
                      cursorColor: Globals.mainColor,
                      enableSuggestions: true,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.multiline,
                      onTap: () {
                        print('tapped');
                      },
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () async {
                                // Get.snackbar('afs`', 'bye');
                                await model.getImage(0, userModel);
                                
                                print('tappdddded');
                              },
                              onDoubleTap: () async{
                                await model.getImage(1, userModel);
                              },
                              child: Icon(Icons.camera)),
                          border: InputBorder.none,
                          focusColor: Colors.transparent,
                          fillColor: Colors.transparent,
                          hintText: 'Type a message'),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Globals.mainColor.withOpacity(1.0),
                  ),
                  onPressed: () async {
                    // print(query.;
                    // await  chatService.sendMessage(model.messageController.text.trim(),
                    //       'mh724476@gmail.com');
                    if (model.messageController.text.trim().isNotEmpty) {
                      await model.sendMessagwe(userModel);
                      // print('not empty');
                    }
                    // printInfo(info: model.title);
                  },
                )
              ],
            ),
          );
        },
        viewModelBuilder: () => NewChatRoomViewModel());
  }
}
