import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/features/find_postman_for_package/presentation/VehicleTypeDisplayWidget.dart';
import 'package:newpostman1/useful/globals.dart';

class PostmanInfoCard extends StatelessWidget {
  PostmanInfoCard({
    @required this.fieldName,
    @required this.fieldValue,
    this.isVehicleType,
  });
  final String fieldName;
  final String fieldValue;
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final bool
      isVehicleType; //this value is set to true is we are displaying about the vehicle details

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.greenAccent,
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
        vertical: blockHeight,
      ),
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      child: Container(
        // height: blockHeight * 10,

        // color: Colors.greenAccent,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: blockHeight * 4,
              padding: EdgeInsets.symmetric(
                horizontal: blockWidth * 2,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                fieldName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            (isVehicleType == true)
                ? VehicleTypeDisplayWidget(travelType: fieldValue)
                : Container(
                    // height: blockHeight * 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: Colors.white,
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                      horizontal: blockWidth * 2,
                      vertical: blockHeight,
                    ),
                    child: Text(
                      fieldValue,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
