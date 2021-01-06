import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/Chat/presentation/Chat%20List%20Tile/ChatListTile.dart';
import 'package:newpostman1/features/Chat/presentation/ChatRoomView/ChatRoomView.dart';
import 'package:newpostman1/features/Chat/presentation/ChatRoomView/newChatRoomView.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatScreenView extends StatelessWidget {
  ChatScreenView({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Messages",
            style: TextStyle(color: Colors.black),
          ),
          // backgroundColor: Globals.mainColor,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        // body: ListView.builder(
        //   itemCount: 10,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ChatListTile();
        //   },
        // ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue[100].withOpacity(.5),
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 10),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: 'Search'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                // height: Get.context.height,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Get.to(NewChatRoomView());
                          // final fifteenApp = new DateTime.now()
                          //     .subtract(new Duration(minutes: 15));
                          // print(timeago.format(fifteenApp));
                          // print(timeago.format(fifteenApp, locale: 'en_short'));
                        },
                        child: ChatTileBuilder());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatTileBuilder extends StatelessWidget {
  ///is new by deault is false if it is set to true this will sohw icons with rows
  final bool isNew;

  ///last message message to show in the header
  final String lastMessage;

  ///* later we should pass the chat model it self to add the data from firebase
  const ChatTileBuilder({
    Key key,
    this.isNew = true,
    this.lastMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Globals.bgColor.withOpacity(.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isNew)
                    Container(
                      padding:
                          EdgeInsets.only(left: 5, right: 5, top: 1, bottom: 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.red[900].withOpacity(.9)),
                      alignment: Alignment.center,
                      child: Text(
                        'new',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  if (isNew)
                    SizedBox(
                      width: 10,
                    ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'I will try to fix the meeting tommarow I will try to fix the meeting tommarow I will try to fix the meeting tommarow',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 14, color: Colors.black.withOpacity(.5)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
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
                              'Mike Edward',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Post Man',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    '33 min ago',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
