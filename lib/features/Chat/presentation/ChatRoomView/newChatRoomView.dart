import 'package:bubble/bubble.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/useful/globals.dart';

class NewChatRoomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      bottomSheet: ChatMessageWidget(),
      appBar: AppBarCustom(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(top: 25),
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Bubble(
                alignment: Alignment.center,
                color: Color.fromRGBO(212, 234, 244, 1.0),
                child: Text('TODAY',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11.0)),
              ),
              Bubble(
                margin: BubbleEdges.only(top: 10),
                alignment: Alignment.topRight,
                nip: BubbleNip.rightTop,
                color: Color.fromRGBO(225, 255, 199, 1.0),
                child: Text('Hello, World!', textAlign: TextAlign.right),
              ),
              Bubble(
                margin: BubbleEdges.only(top: 2),
                alignment: Alignment.topRight,
                nip: BubbleNip.no,
                color: Color.fromRGBO(225, 255, 199, 1.0),
                child: Text('How are you?', textAlign: TextAlign.right),
              ),
              Bubble(
                margin: BubbleEdges.only(top: 10),
                alignment: Alignment.topLeft,
                nip: BubbleNip.leftTop,
                child: Text('Hi, developer!'),
              ),
              Bubble(
                margin: BubbleEdges.only(top: 2),
                alignment: Alignment.topLeft,
                nip: BubbleNip.no,
                child: Text('Well, see for yourself'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.context.height * .06,
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
                        onTap: () {
                          Get.snackbar('afs`', 'bye');

                          print('tappdddded');
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
            onPressed: () {
              printInfo(
                info: 'tapped',
              );
            },
          )
        ],
      ),
    );
  }
}

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
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
                'Mike Edward',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'Online',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
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
