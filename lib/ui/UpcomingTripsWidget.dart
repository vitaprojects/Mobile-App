import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/customWidgets/TripDetailsCard.dart';
import 'package:newpostman1/ui/TripDetailRowCard.dart';

import '../globals.dart';

class UpcomingTripsWidget extends StatefulWidget {
  UpcomingTripsWidget({Key key}) : super(key: key);

  @override
  _UpcomingTripsWidgetState createState() => _UpcomingTripsWidgetState();
}

class _UpcomingTripsWidgetState extends State<UpcomingTripsWidget> {
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
            TripDetailsCard(),
            TripDetailsCard(),
            TripDetailsCard(),
            TripDetailsCard(),
          ],
        ),
      ),
    );
  }
}
