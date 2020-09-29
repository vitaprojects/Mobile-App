import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/TripDetailsCard.dart';

import '../globals.dart';

class DisplayErrandsWidget extends StatefulWidget {
  DisplayErrandsWidget({Key key}) : super(key: key);

  @override
  _DisplayErrandsWidgetState createState() => _DisplayErrandsWidgetState();
}

class _DisplayErrandsWidgetState extends State<DisplayErrandsWidget> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: blockHeight * 2,
            ),
            TripDetailsCard(
              isErrand: true,
            ),
            TripDetailsCard(
              isErrand: true,
            ),
            TripDetailsCard(
              isErrand: true,
            ),
            TripDetailsCard(
              isErrand: true,
            ),
          ],
        ),
      ),
    );
  }
}
