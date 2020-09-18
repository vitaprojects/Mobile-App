import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:newpostman1/customWidgets/WelcomeScreenButtons.dart';
import 'package:newpostman1/customWidgets/WelocmeScreenImage.dart';
import 'package:newpostman1/globals.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key key}) : super(key: key);

  List<Widget> welcomeScreenImages = [
    WelcomeScreenImage(
      bodyText: "Track your packages easily",
      imageAssetName: "assets/images/img1.png",
    ),
    WelcomeScreenImage(
      bodyText: "Earn money while travelling",
      imageAssetName: "assets/images/img2.png",
    ),
    WelcomeScreenImage(
      bodyText: "Send packages to your loved ones easily",
      imageAssetName: "assets/images/img3.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print(Globals.blockHeight);
    print(Globals.blockWidth);
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;
    if (Globals.blockHeight != null && Globals.blockWidth != null) {
      return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: blockHeight * 100,
              width: blockWidth * 100,
              // color: Colors.grey,
              alignment: Alignment.topCenter,
              child: Container(
                height: blockHeight * 85,
                // color: Colors.yellow,
                width: blockWidth * 100,
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  bottom: blockHeight * 10,
                ),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return welcomeScreenImages[index];
                  },
                  itemCount: 3,
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.grey,
                        activeColor: Globals.mainColor,
                      )),
                  // control: new SwiperControl(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: WelcomeScreensButtons(),
            )
          ],
        ),
      ));
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
