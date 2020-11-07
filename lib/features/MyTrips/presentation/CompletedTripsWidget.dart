import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/TripDetailsCard.dart';

import '../../../useful/globals.dart';

class CompletedTripsWidget extends StatefulWidget {
  CompletedTripsWidget({Key key}) : super(key: key);

  @override
  _CompletedTripsWidgetState createState() => _CompletedTripsWidgetState();
}

class _CompletedTripsWidgetState extends State<CompletedTripsWidget> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

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
