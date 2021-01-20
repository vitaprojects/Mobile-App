import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/Chat/presentation/ChatRoomView/newChatRoomView.dart';
import 'package:newpostman1/features/Chat/presentation/addNewChat/addNewChatViewModel.dart';
import 'package:newpostman1/features/find_postman_for_package/presentation/AvailablePostmanDetails.dart';
import 'package:newpostman1/features/find_postman_for_package/presentation/AvailablePostmanViewModel.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

class AvailablePostmanCard extends ViewModelWidget<AvailablePostmanViewModel> {
  AvailablePostmanCard({@required this.itenaryModel});

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final margin = Globals.blockWidth * 5;
  final ItenaryModel itenaryModel;

  @override
  Widget build(BuildContext context, AvailablePostmanViewModel model) {
    return GestureDetector(
      onTap: () {
        print("send this person a request");
        print(model.latestPackage.docId);
        Get.to(AvailablePostmanDetails(
          itenaryModel: itenaryModel,
          callback: () {
            model.showDialogToSendRequest(
              context,
              itenaryModel.details.email,
            );
          },
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          10,
        )),
        elevation: 15,
        margin: EdgeInsets.only(
          bottom: blockHeight * 2,
          left: margin,
          right: margin,
        ),
        child: Container(
          height: blockHeight * 15,
          // color: Colors.greenAccent,

          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                  width: blockHeight * 15,
                  // color: Globals.mainColor,
                  padding: EdgeInsets.all(
                    blockHeight * 2,
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        // color: Colors.yellow,
                        height: blockHeight * 14,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          "assets/images/user.png",
                        ),
                        radius: blockHeight * 7,
                      ),
                      ViewModelBuilder<AddNewChatViewmodel>.nonReactive(
                          builder: (context, modell, widget) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: blockHeight * 3,
                                // color: Colors.redAccent,
                                width: blockWidth * 10,
                                alignment: Alignment.center,
                                child: IconButton(
                                  color: Globals.mainColor,
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(Icons.message),
                                  onPressed: () async {
                                    print("send a message");
                                    print(itenaryModel.details.email);
                                    //TODO when this button is pressend load a chat screen so the user can chat wth the postman

                                    // await FirebaseFirestore.instance
                                    //     .collection('users')
                                    //     .where('email',
                                    //         isEqualTo: itenaryModel.details.email)
                                    //     .get()
                                    //     .then((value) {
                                    //   value.docs[0].data();
                                    //   Get.to(NewChatRoomView(
                                    //       userModel: UserModel.fromJson(
                                    //           value.docs[0].data())));
                                    // });
                                    // modell.userList.forEach((element) {
                                    //   print(element.email);
                                    // });
                                    UserModel userModel = modell
                                        .searchuser(itenaryModel.details.email);
                                    print(userModel.email);

                                    // print(modell.userList);
                                    Get.to(
                                        NewChatRoomView(userModel: userModel));
                                  },
                                ),
                              ),
                            );
                          },
                          viewModelBuilder: () => AddNewChatViewmodel()),
                    ],
                  )),
              Container(
                color: Colors.grey,
                width: blockWidth * 1,
              ),
              Expanded(
                  child: Container(
                // color: Colors.yellowAccent,
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        height: blockHeight * 4,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              10,
                            ),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          itenaryModel.details.email,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: blockHeight * 5.5,
                      color: Colors.grey.shade300,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.yellow,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Departure",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                // color: Colors.orange,
                                alignment: Alignment.centerLeft,
                                child: Text(itenaryModel
                                    .details?.departureLocation?.address
                                    .toString()),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: blockHeight * 5.5,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(
                            10,
                          ))),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.yellow,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Final Destination",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                // color: Colors.orange,
                                alignment: Alignment.centerLeft,
                                child: Text(itenaryModel
                                    .details?.destinationLocation?.address
                                    .toString()),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
