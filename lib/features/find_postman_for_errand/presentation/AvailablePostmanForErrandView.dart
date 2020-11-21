import 'package:flutter/material.dart';
import 'package:newpostman1/useful/globals.dart';

class AvailablePostmanForErrandView extends StatelessWidget {
  AvailablePostmanForErrandView({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final margin = Globals.blockWidth * 5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Globals.mainColor,
          title: Text("Available postman for errand"),
        ),
      ),
    );
  }
}
