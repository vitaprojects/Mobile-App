import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/customWidgets/PostedPackagesWidget.dart';
import 'package:newpostman1/ui/CompletedTripsWidget.dart';
import 'package:newpostman1/ui/UpcomingTripsWidget.dart';

import '../globals.dart';

class TrackPackage extends StatefulWidget {
  TrackPackage({Key key}) : super(key: key);

  @override
  _TrackPackageState createState() => _TrackPackageState();
}

class _TrackPackageState extends State<TrackPackage> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return SafeArea(
      child: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Globals.mainColor,
            bottom: TabBar(
              tabs: [
                Tab(
                  // icon: Icon(Font),
                  child: Text(
                    "Posted(6)".toUpperCase(),
                  ),
                ),
                // Tab(
                //   // icon: Icon(Icons.directions_transit),
                //   child: Text(
                //     "completed".toUpperCase(),
                //   ),
                // ),
              ],
            ),
            title: Text(
              'Track Package',
              textAlign: TextAlign.center,
            ),
          ),
          body: TabBarView(
            children: [
              PostedPackagesWidget(),
              // CompletedTripsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
