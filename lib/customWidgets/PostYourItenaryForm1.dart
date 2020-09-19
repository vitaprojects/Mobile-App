import 'package:flutter/material.dart';

import '../globals.dart';

class PostYourItenaryForm1 extends StatefulWidget {
  PostYourItenaryForm1({Key key}) : super(key: key);

  @override
  _PostYourItenaryForm1State createState() => _PostYourItenaryForm1State();
}

class _PostYourItenaryForm1State extends State<PostYourItenaryForm1> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: blockHeight * 50,
          color: Colors.orange,
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
