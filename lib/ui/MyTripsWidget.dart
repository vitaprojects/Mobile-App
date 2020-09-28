import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/ui/CompletedTripsWidget.dart';
import 'package:newpostman1/ui/UpcomingTripsWidget.dart';

import '../globals.dart';

class MyTripsWidget extends StatefulWidget {
  MyTripsWidget({Key key}) : super(key: key);

  @override
  _MyTripsWidgetState createState() => _MyTripsWidgetState();
}

class _MyTripsWidgetState extends State<MyTripsWidget> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Globals.mainColor,
            bottom: TabBar(
              tabs: [
                Tab(
                  // icon: Icon(Font),
                  child: Text(
                    "Upcoming".toUpperCase(),
                  ),
                ),
                Tab(
                  // icon: Icon(Icons.directions_transit),
                  child: Text(
                    "completed".toUpperCase(),
                  ),
                ),
              ],
            ),
            title: Text(
              'My Trips',
              textAlign: TextAlign.center,
            ),
          ),
          body: TabBarView(
            children: [
              UpcomingTripsWidget(),
              CompletedTripsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
