import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/Chat/presentation/ChatRoomView/chatMessageBuilderView.dart';
import 'package:newpostman1/features/Chat/presentation/ChatRoomView/newChatRommViewModel.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

class ChatMessageWidget extends StatelessWidget {
  final ScrollController scrollController;
  final UserModel userModel;
  ChatMessageWidget({
    Key key,
    @required this.userModel,
    @required this.scrollController,
    this.globalKey,
  }) : super(key: key);
  final GlobalKey<State<ChatmessagesBuilderView>> globalKey;

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

                        ///*This scrolls to last postion of the message when tapped
                        if (scrollController != null &&
                            scrollController.position.maxScrollExtent != 0.0 &&
                            scrollController.offset <
                                scrollController.position.maxScrollExtent) {
                          scrollController.jumpTo(
                              scrollController.position.maxScrollExtent + 150);
                        }
                      },
                      // autofocus: true,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () async {
                                // Get.snackbar('afs`', 'bye');
                                await model.getImage(0, userModel);
                              },

                              ///*`[onDoubleTap]` this callback is used to load open the gallery
                              onDoubleTap: () async {
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
                    if (model.messageController.text.trim().isNotEmpty) {
                      await model.sendMessagwe(userModel, scrollController);
                    }
                  },
                ),
              ],
            ),
          );
        },
        viewModelBuilder: () => NewChatRoomViewModel());
  }
}
