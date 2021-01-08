import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/Chat/data/chatModel.dart';
import 'package:newpostman1/features/Chat/data/chat_service.dart';
import 'package:newpostman1/features/Chat/presentation/ChatRoomView/chatMessageBuilderView.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/useful/service_locator.dart';

import 'chatMessageWidget.dart';

class NewChatRoomView extends StatelessWidget {
  final UserModel userModel;
  final ChatService chatService = locator<ChatService>();

  NewChatRoomView({Key key, @required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        extendBody: true,
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        // extendBodyBehindAppBar: true,
        // bottomSheet: ChatMessageWidget(
        //   userModel: userModel,
        // ),
        appBar: AppBarCustom(
          userModel: userModel,
        ),
        body: Column(
          children: [
            Expanded(
              child: ChatmessagesBuilderView(
                userModel: userModel,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            ChatMessageWidget(
              userModel: userModel,
            )
          ],
        ),
      ),
    );
  }
}

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final UserModel userModel;

  const AppBarCustom({Key key, @required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel.fname ?? 'Mike Edward',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 3,
              ),
              // Text(
              //   'Online',
              //   style: TextStyle(
              //     fontSize: 13,
              //     color: Colors.grey[600],
              //   ),
              // ),
            ],
          )
        ],
      ),
      leading: InkWell(
        onTap: () => Get.back(),
        child: Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
