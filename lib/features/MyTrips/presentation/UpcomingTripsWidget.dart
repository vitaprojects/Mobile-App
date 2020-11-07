import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/TripDetailsCard.dart';
import 'package:newpostman1/features/MyTrips/presentation/MyTripsViewModel.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

class UpcomingTripsWidget extends ViewModelWidget<MyTripsViewModel> {
  UpcomingTripsWidget({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context, MyTripsViewModel model) {
    return Scaffold(
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: blockHeight * 2,
      //       ),
      //       TripDetailsCard(),
      //       TripDetailsCard(),
      //       TripDetailsCard(),
      //       TripDetailsCard(),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          SizedBox(
            height: blockHeight * 2,
          ),
          Expanded(
            child: StreamBuilder(
              stream: model.tripService.getAllTrips(0),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  print("printing data");
                  // QuerySnapshot querySnapshot = snapshot.data;
                  print(snapshot.data?.length.toString() + "length of data");
                  // return Text("hiii");
                  List<ItenaryModel> trips = snapshot.data;
                  return ListView.builder(
                    itemCount: trips.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TripDetailsCard(
                        isItenary: true,
                        itenaryModel: trips[index],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
