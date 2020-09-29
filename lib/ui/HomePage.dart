import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:newpostman1/customWidgets/DrawerWidget.dart';
import 'package:newpostman1/customWidgets/ModeSelectionWidget.dart';
import 'package:newpostman1/globals.dart';
import 'package:newpostman1/ui/PostYourItenary.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  goToSendPackage() {
    print("go to send package");
  }

  goToPostItenary() {
    print("post itenary");
  }

  final pages = [
    Container(
      child: ModeSelectionWidget(
        assetName: "assets/images/travel.png",
        bodyText: "Earn money while travelling",
        buttonText: "post itenary",
        isFirstPage: true,
        // methodInButton: () {
        //   print("post");
        //   Get.to(PostYourItenary());
        // },
      ),
    ),
    Container(
        child: ModeSelectionWidget(
      assetName: "assets/images/sendPackage.png",
      bodyText: "Send your package with ease",
      buttonText: "send package",
      isFirstPage: false,
      // methodInButton: () {
      //   print("send");
      // },
    ))
  ];

  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  void _toggle() {
    _innerDrawerKey.currentState.toggle(
        // direction is optional
        // if not set, the last direction will be used
        //InnerDrawerDirection.start OR InnerDrawerDirection.end
        direction: InnerDrawerDirection.end);
  }

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return SafeArea(
        child: InnerDrawer(
      key: _innerDrawerKey,
      onTapClose: true,
      leftChild: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: DrawerWidget(),
      ),
      colorTransitionChild: Globals.mainColor,
      colorTransitionScaffold: Colors.black54, // default Color.black54
      borderRadius: 50, // default 0
      leftAnimationType: InnerDrawerAnimation.static, // default static
      rightAnimationType: InnerDrawerAnimation.quadratic,
      // offset: IDOffset.only(right: 0.0, left: 0.0),
      backgroundDecoration: BoxDecoration(color: Colors.white),

      rightChild: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: DrawerWidget(),
      ),
      swipe: true,
      scaffold: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   leading: Icon(
        //     Icons.menu,
        //     color: Colors.black,
        //   ),
        // ),
        body: Column(
          children: [
            Container(
              height: blockHeight * 15,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: blockHeight * 8,
                    // color: Colors.orange,
                    alignment: Alignment.center,
                    child: Container(
                      height: blockHeight * 7,
                      width: blockHeight * 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.red,
                      ),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/user.png",
                        ),
                        radius: blockHeight * 3.5,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: blockHeight * 5,
                    // color: Colors.blue,
                    alignment: Alignment.center,
                    child: Container(
                      height: blockHeight * 4,
                      // color: Colors.yellow,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "welcome back".toUpperCase(),
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        minFontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: LiquidSwipe(
              pages: pages,
              liquidController: LiquidController(),
              enableSlideIcon: true,
              waveType: WaveType.liquidReveal,
            ))
          ],
        ),
      ),
    ));
  }
}
