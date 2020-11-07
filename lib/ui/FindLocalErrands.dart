import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/customWidgets/DisplayErrandsWidget.dart';
import 'package:newpostman1/features/MyTrips/presentation/CompletedTripsWidget.dart';
import 'package:newpostman1/features/MyTrips/presentation/UpcomingTripsWidget.dart';

import '../useful/globals.dart';

class FindLocalErrands extends StatefulWidget {
  FindLocalErrands({Key key}) : super(key: key);

  @override
  _FindLocalErrandsState createState() => _FindLocalErrandsState();
}

class _FindLocalErrandsState extends State<FindLocalErrands> {
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
                    "Errands".toUpperCase(),
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
              'Find local errands',
              textAlign: TextAlign.center,
            ),
          ),
          body: TabBarView(
            children: [
              DisplayErrandsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
