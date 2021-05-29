import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/features/MyPackages/presentation/posted-packages/PostedPackagesView.dart';
import 'package:newpostman1/features/MyPackages/presentation/posted-packages/PostedPackagesViewModel.dart';
import 'package:newpostman1/features/MyPackages/presentation/track-package/TrackPackageViewModel.dart';
import 'package:newpostman1/features/MyTrips/presentation/CompletedTripsWidget.dart';
import 'package:newpostman1/features/MyTrips/presentation/UpcomingTripsWidget.dart';
import 'package:stacked/stacked.dart';

import '../../../../useful/globals.dart';

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

    return ViewModelBuilder<TrackPackageViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Globals.mainColor,
                title: Text("Track Packages"),
              ),
              body: (model.dataReady
                  ? Builder(
                      builder: (context) {
                        if (model.data.isEmpty) {
                          return Center(
                            child: Text(
                              "You don't have any pacakges to track",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: model.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 10,
                                margin: EdgeInsets.only(
                                  bottom: blockHeight * 2,
                                  left: blockWidth * 5,
                                  right: blockWidth * 5,
                                ),
                                child: Container(
                                  height: blockHeight * 15,
                                  // color: Colors.orange,
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: blockHeight * 5,
                                        // color: Colors.yellow,
                                        alignment: Alignment.center,
                                        child: Text(
                                            "Order ID : ${model.data[index].orderID}"),
                                      ),
                                      Container(
                                        height: blockHeight * 5,
                                        // color: Colors.yellow,
                                        alignment: Alignment.center,
                                        child: Text(
                                            "Postman : ${model.data[index].postmanEmail}"),
                                      ),
                                      Container(
                                        height: blockHeight * 5,
                                        // color: Colors.yellow,
                                        alignment: Alignment.center,
                                        child: Text(
                                            "Order Amount : ${model.data[index].totalAmount}"),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    )
                  : Center(child: CircularProgressIndicator())),
            ),
          );
        },
        viewModelBuilder: () => TrackPackageViewModel());
  }
}
