import 'package:flutter/material.dart';

import '../globals.dart';

class PostYourErrand extends StatefulWidget {
  PostYourErrand({Key key}) : super(key: key);

  @override
  _PostYourErrandState createState() => _PostYourErrandState();
}

class _PostYourErrandState extends State<PostYourErrand> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                stretchTriggerOffset: 100,
                backgroundColor: Colors.white,
                stretch: true,
                expandedHeight: blockHeight * 20,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "Post Your Errand",
                    style: TextStyle(
                      // fontSize: 2,
                      color: Globals.mainColor,
                      fontSize: 25,
                    ),
                  ),
                  centerTitle: true,
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.fadeTitle,
                    StretchMode.blurBackground,
                  ],
                  // background: Image.asset(
                  //   "assets/images/travel.png",
                  //   height: blockHeight * 32,
                  //   width: blockWidth * 70,
                  //   fit: BoxFit.contain,
                  // ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                // PostYourErrandForm1(),
              ]))
            ],
          )),
    );
  }
}
