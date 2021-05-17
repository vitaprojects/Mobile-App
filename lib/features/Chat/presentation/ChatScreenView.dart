import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../../../models/user/UserModel.dart';
import '../../../useful/globals.dart';
import '../../../useful/service_locator.dart';
import '../../authentication/domain/auth_service.dart';
import '../data/chatModel.dart';
import 'ChatRoomView/newChatRoomView.dart';
import 'addNewChat/addNewChatViewModel.dart';
import 'chatScreenViewModl.dart';

class ChatScreenView extends StatelessWidget {
  ChatScreenView({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Get.to(AddNewChatView());
        //     // final locatorservice = locator<ChatService>();
        //     // Stream<List<UserModel>> lst = locatorservice.getUsers;
        //     // lst.forEach((element) {
        //     //   element.forEach((element) {
        //     //     print(element.email);
        //     //   });
        //     // });
        //   },
        //   tooltip: 'New Message',
        //   elevation: 0.0,
        //   backgroundColor: Globals.mainColor,
        //   child: Icon(Icons.message),
        // ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Messages",
            style: TextStyle(color: Colors.black),
          ),
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
                  child: ViewModelBuilder<ChatScreenViewModel>.reactive(
                      builder: (context, model, widget) {
                        print(model.userChats == null
                            ? 'Null user chats'
                            : 'UserChars hasdata');

                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: model.userChats != null
                              ? model.userChats.length ?? 0
                              : 0,
                          itemBuilder: (context, index) {
                            return ChatTileBuilder(
                              chatModel: model.userChats[index],
                            );
                          },
                        );
                      },
                      viewModelBuilder: () => ChatScreenViewModel())),
            )
          ],
        ),
      ),
    );
  }
}

///*list tile to show the users
class ChatTileBuilder extends StatelessWidget {
  final ChatModel chatModel;

  ///* later we should pass the chat model it self to add the data from firebase
  const ChatTileBuilder({
    Key key,
    @required this.chatModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(user.fname);
    return ViewModelBuilder<AddNewChatViewmodel>.reactive(
        builder: (context, model, widget) {
          UserModel userModel = model.searchuser(chatModel.email);

          // print(userModel.email);

          return InkWell(
            onTap: () async {
              // User user = await authenticationService.getCurrentUser();

              // printInfo(info: user.email);
              Get.to(NewChatRoomView(
                userModel: userModel,
              ));
              // final fifteenApp = new DateTime.now()
              //     .subtract(new Duration(minutes: 15));
              // print(timeago.format(fifteenApp));
              // print(timeago.format(fifteenApp, locale: 'en_short'));
            },
            child: Card(
              color: Globals.bgColor.withOpacity(.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
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
                                  userModel != null
                                      ? userModel.fname ??
                                          'Seems like u dont have a name'
                                      : 'Seems like u dont have a name',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  userModel != null
                                      ? userModel.email ?? 'No users identified'
                                      : 'No users identified',
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
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => AddNewChatViewmodel());
  }
}
