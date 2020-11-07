import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/TripDetailsCard.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';
import 'MyTripsViewModel.dart';

class CompletedTripsWidget extends ViewModelWidget<MyTripsViewModel> {
  CompletedTripsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, MyTripsViewModel model) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: blockHeight * 2,
          ),
          Expanded(
            child: StreamBuilder(
              stream: model.tripService.getAllTrips(1),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  print("printing data");
                  // QuerySnapshot querySnapshot = snapshot.data;
                  print(snapshot.data?.length.toString() + "length of data");
                  // return Text("hiii");
                  List<ItenaryModel> trips = snapshot.data;
                  if (trips.length != 0) {
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
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: blockWidth * 5,
                        ),
                        height: blockHeight * 15,
                        // color: Colors.red,
                        alignment: Alignment.center,
                        child: Container(
                          height: blockHeight * 10,
                          // color: Colors.yellow,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            "You don't have any completed trips",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                            minFontSize: 15,
                          ),
                        ),
                      ),
                    );
                  }
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
