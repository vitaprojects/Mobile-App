import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/features/MyPackages/presentation/PostedPackagesView.dart';
import 'package:newpostman1/features/MyPackages/presentation/PostedPackagesViewModel.dart';
import 'package:newpostman1/features/MyTrips/presentation/CompletedTripsWidget.dart';
import 'package:newpostman1/features/MyTrips/presentation/UpcomingTripsWidget.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

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

    return ViewModelBuilder.nonReactive(
        builder: (context, model, child) {
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
                          "Posted".toUpperCase(),
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
                    'All Shipments',
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
        },
        viewModelBuilder: () => PostedPackagesViewModel());
  }
}
