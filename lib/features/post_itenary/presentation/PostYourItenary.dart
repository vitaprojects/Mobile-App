import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/post_itenary/presentation/PostYourItenaryFormView.dart';

import '../../../useful/globals.dart';

class PostYourItenary extends StatefulWidget {
  PostYourItenary({Key key}) : super(key: key);

  @override
  _PostYourItenaryState createState() => _PostYourItenaryState();
}

class _PostYourItenaryState extends State<PostYourItenary> {
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
                    "Travel Details",
                    style: TextStyle(
                      // fontSize: 2,
                      // color: Globals.mainColor,
                      color: Colors.black,
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
                PostYourItenaryFormView(),
              ]))
            ],
          )),
    );
  }
}
