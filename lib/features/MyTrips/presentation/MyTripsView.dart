import 'package:flutter/material.dart';
import 'package:newpostman1/features/MyTrips/presentation/CompletedTripsWidget.dart';
import 'package:newpostman1/features/MyTrips/presentation/MyTripsViewModel.dart';
import 'package:newpostman1/features/MyTrips/presentation/UpcomingTripsWidget.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

class MyTripsView extends StatefulWidget {
  MyTripsView({Key key}) : super(key: key);

  @override
  _MyTripsViewState createState() => _MyTripsViewState();
}

class _MyTripsViewState extends State<MyTripsView> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return ViewModelBuilder.nonReactive(
        builder: (context, model, child) {
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
                          "Pending".toUpperCase(),
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
        },
        viewModelBuilder: () => MyTripsViewModel());
  }
}
