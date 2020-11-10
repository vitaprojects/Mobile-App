import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/find_postman/presentation/AvailablePostmanViewModel.dart';
import 'package:newpostman1/features/find_postman/presentation/PostmanInfoCard.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

class AvailablePostmanDetails extends StatelessWidget {
  AvailablePostmanDetails({
    @required this.itenaryModel,
  });
  final ItenaryModel itenaryModel;
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

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
            PostmanInfoCard(
              fieldName: "Postman email",
              fieldValue: itenaryModel.details.email,
            ),
            PostmanInfoCard(
              fieldName: "Postman email",
              fieldValue: itenaryModel.details.email,
            ),
            PostmanInfoCard(
              fieldName: "Departure location",
              fieldValue:
                  itenaryModel?.details?.departureLocation?.address != null
                      ? itenaryModel.details.departureLocation.address
                      : "",
            ),
            PostmanInfoCard(
              fieldName: "Destination location",
              fieldValue:
                  itenaryModel?.details?.destinationLocation?.address != null
                      ? itenaryModel.details.destinationLocation.address
                      : "",
            ),
            PostmanInfoCard(
              fieldName: "Travel Type",
              isVehicleType: true,
              fieldValue: itenaryModel.travelType.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
