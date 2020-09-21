import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/SelectTravelType.dart';

import '../globals.dart';

class PostYourItenaryForm1 extends StatefulWidget {
  PostYourItenaryForm1({Key key}) : super(key: key);

  @override
  _PostYourItenaryForm1State createState() => _PostYourItenaryForm1State();
}

class _PostYourItenaryForm1State extends State<PostYourItenaryForm1> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  Color chipColor = Colors.white;
  int travelType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: blockHeight * 5,
        ),
        SelectTravelType(
          onChoiceSelected: (int val) {
            print(val);
            travelType = val;
          },
        ),
        Container(
          height: blockHeight * 50,
          color: Colors.green,
        ),
        Container(
          height: blockHeight * 50,
          color: Colors.orange,
        ),
        Container(
          height: blockHeight * 50,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
