import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/ItemWidgetInDrawer.dart';
import 'package:newpostman1/customWidgets/TitleWidgetInDrawer.dart';
import 'package:newpostman1/ui/AboutUsPage.dart';
import 'package:newpostman1/ui/AvailablePostman.dart';
import 'package:newpostman1/ui/FindLocalErrands.dart';
import 'package:newpostman1/ui/MyTripsWidget.dart';
import 'package:newpostman1/ui/OngoingErrands.dart';
import 'package:newpostman1/ui/PostYourErrand.dart';
import 'package:newpostman1/ui/PostYourItenary.dart';
import 'package:newpostman1/ui/SendPackage.dart';
import 'package:newpostman1/ui/SupportWidget.dart';
import 'package:newpostman1/ui/TotalEarningsWidget.dart';
import 'package:newpostman1/ui/TrackPackage.dart';

import '../globals.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({
    this.closeDrawer,
  });

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final VoidCallback closeDrawer;

  @override
  Widget build(BuildContext context) {
    final double margin = blockWidth * 2;

    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: blockHeight * 12,
              // color: Colors.yellow,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 9,
                // color: Colors.redAccent,
                margin: EdgeInsets.symmetric(
                  horizontal: margin,
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: blockHeight * 4.5,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                        "assets/images/user.png",
                      ),
                    ),
                    Container(
                      width: blockWidth * 3,
                      // color: Colors.green,
                    ),
                    Expanded(
                        child: Container(
                      // color: Colors.orangeAccent,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: blockHeight * 3,
                            // color: Colors.redAccent,
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              "Danu",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              minFontSize: 14,
                            ),
                          ),
                          Container(
                            height: blockHeight * 3,
                            // color: Colors.yellowAccent,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "dulajmichael@gmail.com",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            height: blockHeight * 3,
                            // color: Colors.yellowAccent,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "123456",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Globals.mainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Divider(
              height: blockHeight,
              thickness: blockHeight / 2,
            ),
            TitleWidgetInDrawer(
              title: "Itenary",
              margin: margin,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: margin,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: margin,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.plusSquare,
                    ),
                    title: "Post Itenary",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                      Get.to(PostYourItenary());
                    },
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.search,
                    ),
                    title: "Available Shipments",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();

                      print("go to find package");
                    },
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.stumbleupon,
                    ),
                    margin: margin,
                    ontapFunc: () {
                      Get.to(MyTripsWidget());
                      closeDrawer();
                    },
                    title: "My Offers",
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.map,
                    ),
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                      Get.to(MyTripsWidget());
                    },
                    title: "Trips",
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.moneyBill,
                    ),
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                      Get.to(TotalEarningsWidget());
                    },
                    title: "Earnings",
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.facebookMessenger,
                    ),
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                      // Get.to(MyTripsWidget());
                    },
                    title: "Chats",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: blockHeight * 2,
            ),
            TitleWidgetInDrawer(
              title: "Customer Packages",
              margin: margin,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: margin,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: margin,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.archive,
                    ),
                    title: "Ship a new package",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                      Get.to(SendPackage());
                    },
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.personBooth,
                    ),
                    title: "Find Postman",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                      Get.to(AvailablePostman());
                    },
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.mapMarkerAlt,
                    ),
                    title: "Posted Shipments",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();

                      print("go to track package");
                      Get.to(TrackPackage());
                    },
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.moneyBillAlt,
                    ),
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                      // Get.to(MyTripsWidget());
                    },
                    title: "Payment Requests",
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.locationArrow,
                    ),
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                      Get.to(TrackPackage());
                    },
                    title: "Track Package",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: blockHeight * 2,
            ),
            TitleWidgetInDrawer(
              title: "Errands",
              margin: margin,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: margin,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: margin,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.walking,
                    ),
                    title: "Ongoing Errands",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();

                      print("ongoing errands");
                      Get.to(OngoingErrands());
                    },
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.box,
                    ),
                    title: "Place a new Errand",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();

                      print("go to track package");
                      Get.to(PostYourErrand());
                    },
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.box,
                    ),
                    title: "Posted Errands",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                      Get.to(FindLocalErrands());
                    },
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.box,
                    ),
                    title: "Completed Errands",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                      Get.to(FindLocalErrands());
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: blockHeight * 2,
            ),
            TitleWidgetInDrawer(
              title: "Other",
              margin: margin,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: margin,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: margin,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.headset,
                    ),
                    title: "Support",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                      Get.to(SupportWidget());
                    },
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.bell,
                    ),
                    title: "Notifications",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                    },
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  // ItemWidgetInDrawer(
                  //   icon: Icon(
                  //     FontAwesomeIcons.infoCircle,
                  //   ),
                  //   title: "About US",
                  //   margin: margin,
                  //   ontapFunc: () {
                  //     closeDrawer();
                  //     Get.to(AboutUSPage());
                  //   },
                  // ),
                  // Divider(
                  //   height: blockHeight / 2,
                  //   thickness: blockHeight / 4,
                  // ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.shareAlt,
                    ),
                    title: "Share",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                    },
                  ),
                  Divider(
                    height: blockHeight / 2,
                    thickness: blockHeight / 4,
                  ),
                  ItemWidgetInDrawer(
                    icon: Icon(
                      FontAwesomeIcons.signOutAlt,
                    ),
                    title: "Logout",
                    margin: margin,
                    ontapFunc: () {
                      closeDrawer();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: blockHeight * 5,
            )
          ],
        ),
      ),
    );
  }
}
