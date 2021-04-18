import 'package:flutter/material.dart';
import 'package:newpostman1/features/post_itinerary/presentation/post_your_itinerary_form_view.dart';

import '../../../useful/globals.dart';

///This [`page`] is loaded when the user is posting a [`itinerary`]
class PostYourItinerary extends StatefulWidget {
  PostYourItinerary({Key key}) : super(key: key);

  @override
  _PostYourItineraryState createState() => _PostYourItineraryState();
}

class _PostYourItineraryState extends State<PostYourItinerary> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;

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
                PostYourItineraryFormView(),
              ]))
            ],
          )),
    );
  }
}
