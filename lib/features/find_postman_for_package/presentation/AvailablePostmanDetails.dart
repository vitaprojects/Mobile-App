import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/find_postman_for_package/presentation/PostmanInfoCard.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

class AvailablePostmanDetails extends StatelessWidget {
  AvailablePostmanDetails({
    @required this.itenaryModel,
    @required this.callback,
  });
  final ItenaryModel itenaryModel;
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: blockHeight * 12,
              // color: Colors.redAccent,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 5,
                // color: Colors.yellow,
                alignment: Alignment.center,
                child: AutoSizeText(
                  "Postman Details",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  minFontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PostmanInfoCard(
                      fieldName: "Postman email",
                      fieldValue: itenaryModel.details.email,
                    ),
                    // PostmanInfoCard(
                    //   fieldName: "Postman email",
                    //   fieldValue: itenaryModel.details.email,
                    // ),
                    PostmanInfoCard(
                      fieldName: "Departure location",
                      fieldValue:
                          itenaryModel?.details?.departureLocation?.address !=
                                  null
                              ? itenaryModel.details.departureLocation.address
                              : "",
                    ),
                    PostmanInfoCard(
                      fieldName: "Destination location",
                      fieldValue:
                          itenaryModel?.details?.destinationLocation?.address !=
                                  null
                              ? itenaryModel.details.destinationLocation.address
                              : "",
                    ),
                    PostmanInfoCard(
                      fieldName: "Travel Type",
                      isVehicleType: true,
                      fieldValue: itenaryModel.travelType.toString(),
                    ),
                    PostmanInfoCard(
                      fieldName: "Can deliver",
                      // isVehicleType: true,
                      fieldValue: (itenaryModel.details.canDeliver == true)
                          ? "Yes"
                          : "No",
                    ),
                    PostmanInfoCard(
                      fieldName: "Can pickup",
                      // isVehicleType: true,
                      fieldValue: (itenaryModel.details.canPickup == true)
                          ? "Yes"
                          : "No",
                    ),
                    Container(
                      // color: Colors.redAccent,
                      height: blockHeight * 5,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: blockWidth * 5,
                      ),
                      height: blockHeight * 10,
                      // color: Colors.yellowAccent,
                      alignment: Alignment.center,
                      child: Container(
                        height: blockHeight * 7,
                        // color: Colors.redAccent,
                        alignment: Alignment.center,
                        child: Container(
                          width: blockWidth * 70,
                          child: RaisedButton(
                            color: Globals.mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            padding: EdgeInsets.all(
                              0,
                            ),
                            onPressed: () {
                              callback();
                            },
                            child: Container(
                              width: blockWidth * 60,
                              // color: Colors.greenAccent,
                              alignment: Alignment.center,
                              child: Container(
                                height: blockHeight * 4,
                                // color: Colors.redAccent,
                                alignment: Alignment.center,
                                child: Text(
                                  "Select Postman".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.redAccent,
                      height: blockHeight * 5,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
