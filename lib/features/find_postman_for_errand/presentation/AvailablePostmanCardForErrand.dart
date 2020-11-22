import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/find_postman_for_errand/presentation/AvailablePostmanForErrandViewModel.dart';
import 'package:newpostman1/features/find_postman_for_package/presentation/AvailablePostmanDetails.dart';
import 'package:newpostman1/features/find_postman_for_package/presentation/AvailablePostmanViewModel.dart';
import 'package:newpostman1/features/post_errand/data/RunErrandModel.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

class AvailablePostmanCardForErrand
    extends ViewModelWidget<AvailablePostmanForErrandViewModel> {
  AvailablePostmanCardForErrand({
    @required this.runErrandModel,
  });

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final margin = Globals.blockWidth * 5;
  final RunErrandModel runErrandModel;

  @override
  Widget build(BuildContext context, AvailablePostmanForErrandViewModel model) {
    return GestureDetector(
      onTap: () {
        print("send this person a request");
        // Get.to(AvailablePostmanDetails(
        //   itenaryModel: itenaryModel,
        //   callback: () {
        //     model.showDialogToSendRequest(
        //       context,
        //       itenaryModel.details.email,
        //     );
        //   },
        // ));
        model.showDialogToSendRequest(context, runErrandModel.postmanEmail);
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
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    "assets/images/user.png",
                  ),
                  radius: blockHeight * 7,
                ),
              ),
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
                          runErrandModel.postmanEmail,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: blockHeight * 11,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(
                            10,
                          ))),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.yellow,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(
                              left: blockWidth * 2,
                              top: blockHeight / 2,
                              bottom: blockHeight / 2,
                            ),
                            child: Text(
                              "Address".toUpperCase(),
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              //   color: Colors.orange,
                              alignment: Alignment.centerLeft,
                              child: FutureBuilder(
                                future: model.getAddressFromCoordinates(
                                    runErrandModel.latitude,
                                    runErrandModel.longitude),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    String address = snapshot.data;
                                    if (address != null) {
                                      return Text(address);
                                    } else {
                                      return Text("Loading");
                                    }
                                  } else {
                                    return Text("Loading");
                                  }
                                },
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
