import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/Chat/presentation/ChatScreenView.dart';
import 'package:newpostman1/features/MyPackages/presentation/TrackPackage.dart';
import 'package:newpostman1/features/MyTrips/presentation/MyTripsView.dart';
import 'package:newpostman1/features/TotalEarnings/presentation/pages/TotalEarningsWidget.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/features/drawer/presentation/ItemWidgetInDrawer.dart';
import 'package:newpostman1/features/drawer/presentation/TitleWidgetInDrawer.dart';
import 'package:newpostman1/features/drawer/presentation/pages/drawer_widget_viewmodel.dart';
import 'package:newpostman1/features/find_postman_for_errand/presentation/AvailablePostmanForErrandView.dart';
import 'package:newpostman1/features/find_postman_for_package/presentation/AvailablePostmanView.dart';
import 'package:newpostman1/features/post_errand/presentation/PostYourErrand.dart';
import 'package:newpostman1/features/post_itinerary/presentation/post_your_Itinerary.dart';
import 'package:newpostman1/features/send_package/presentation/SendPackage.dart';
import 'package:newpostman1/ui/FindLocalErrands.dart';
import 'package:newpostman1/ui/OngoingErrands.dart';
import 'package:newpostman1/ui/SupportWidget.dart';
import 'package:newpostman1/ui/ThankYouWidget.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

import '../../../../useful/globals.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({
    this.closeDrawer,
  });

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final VoidCallback closeDrawer;
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    final double margin = blockWidth * 2;

    return ViewModelBuilder<DrawerWidgetViewModel>.reactive(
        onModelReady: (model) {
          model.listenToChangesInUserModel();
        },
        builder: (_, model, child) {
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: blockHeight * 3,
                                  // color: Colors.redAccent,
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    Hive.box('user').get('uname') != null
                                        ? Hive.box('user').get('uname')
                                        : "Username",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    minFontSize: 14,
                                  ),
                                ),
                                Container(
                                  // height: blockHeight * 4,
                                  // color: Colors.yellowAccent,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    Hive.box('user').get('email') != null
                                        ? Hive.box('user').get('email')
                                        : "Email",
                                    maxLines: 2,
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
                                    "${model.totalEarnings} \$",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16),
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
                            Get.to(PostYourItinerary());
                          },
                        ),
                        Divider(
                          height: blockHeight / 2,
                          thickness: blockHeight / 4,
                        ),
                        // ItemWidgetInDrawer(
                        //   icon: Icon(
                        //     FontAwesomeIcons.search,
                        //   ),
                        //   title: "Available Shipments",
                        //   margin: margin,
                        //   ontapFunc: () {
                        //     closeDrawer();

                        //     print("go to find package");
                        //   },
                        // ),
                        // Divider(
                        //   height: blockHeight / 2,
                        //   thickness: blockHeight / 4,
                        // ),
                        // ItemWidgetInDrawer(
                        //   icon: Icon(
                        //     FontAwesomeIcons.stumbleupon,
                        //   ),
                        //   margin: margin,
                        //   ontapFunc: () {
                        //     // Get.to(MyTripsView());
                        //     Get.to(ThankYouWidget());
                        //     closeDrawer();
                        //   },
                        //   title: "My Offers",
                        // ),
                        // Divider(
                        //   height: blockHeight / 2,
                        //   thickness: blockHeight / 4,
                        // ),
                        ItemWidgetInDrawer(
                          icon: Icon(
                            FontAwesomeIcons.map,
                          ),
                          margin: margin,
                          ontapFunc: () {
                            closeDrawer();
                            Get.to(MyTripsView());
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
                            Get.to(ChatScreenView());
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
                            Get.to(AvailablePostmanView());
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
                            FontAwesomeIcons.search,
                          ),
                          title: "Find Postman",
                          margin: margin,
                          ontapFunc: () {
                            closeDrawer();

                            print("ongoing errands");
                            Get.to(AvailablePostmanForErrandView());
                          },
                        ),
                        Divider(
                          height: blockHeight / 2,
                          thickness: blockHeight / 4,
                        ),
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
                            // Get.to(LoginPageView());
                            authenticationService.signOut();
                            model.userData.clearData();
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
        },
        viewModelBuilder: () => DrawerWidgetViewModel());
  }
}
