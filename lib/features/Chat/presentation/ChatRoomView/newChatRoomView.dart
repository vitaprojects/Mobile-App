import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/user/UserModel.dart';
import '../../../../useful/service_locator.dart';
import '../../data/chat_service.dart';
import 'chatMessageBuilderView.dart';
import 'chatMessageWidget.dart';

class NewChatRoomView extends StatefulWidget {
  final UserModel userModel;

  NewChatRoomView({Key key, @required this.userModel}) : super(key: key);

  @override
  _NewChatRoomViewState createState() => _NewChatRoomViewState();
}

class _NewChatRoomViewState extends State<NewChatRoomView> {
  ScrollController scrollController;
  final ChatService chatService = locator<ChatService>();
  // scrolllistner() {
  //   if (scrollController.offset >= scrollController.position.maxScrollExtent &&
  //       !scrollController.position.outOfRange) {
  //     print(
  //         '*****************Reached the bottom ********************************************');
  //   }

  //   if (scrollController.offset <= scrollController.position.minScrollExtent &&
  //       !scrollController.position.outOfRange) {
  //     print(
  //         '*************************reached top*******************************************************');
  //   }
  // }

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        extendBody: true,
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,

        appBar: AppBarCustom(
          userModel: widget.userModel,
        ),
        body: Column(
          children: [
            Expanded(
              child: ChatmessagesBuilderView(
                userModel: widget.userModel,
                scrollController: scrollController,
              ),
            ),
            ChatMessageWidget(
              scrollController: scrollController,
              userModel: widget.userModel,
            )
          ],
        ),
      ),
    );
  }
}

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final UserModel userModel;

  const AppBarCustom({Key key, @required this.userModel})
      : assert(userModel != null, 'User model cannot be null'),
        super(key: key);

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
              child:
                  // Image.network(
                  //   'https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg',
                  //   fit: BoxFit.cover,
                  // ),
                  Image.asset('assets/images/user.png'),
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
