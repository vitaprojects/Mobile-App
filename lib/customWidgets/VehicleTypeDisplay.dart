import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/useful/globals.dart';

class VehicleTypeDisplay extends StatelessWidget {
  VehicleTypeDisplay({@required this.vehicleType});
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final int vehicleType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: blockHeight * 4.5,
      // color: Colors.yellow,
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (vehicleType == 0) {
            return Row(
              children: [
                Icon(
                  FontAwesomeIcons.bus,
                ),
                SizedBox(
                  width: blockWidth * 3,
                ),
                Text(
                  "Bus".toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            );
          } else if (vehicleType == 1) {
            return Row(
              children: [
                Icon(
                  FontAwesomeIcons.car,
                ),
                SizedBox(
                  width: blockWidth * 3,
                ),
                Text(
                  "Car".toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            );
          } else if (vehicleType == 2) {
            return Row(
              children: [
                Icon(
                  FontAwesomeIcons.truck,
                ),
                SizedBox(
                  width: blockWidth * 3,
                ),
                Text(
                  "Truck".toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            );
          } else if (vehicleType == 3) {
            return Row(
              children: [
                Icon(
                  FontAwesomeIcons.plane,
                ),
                SizedBox(
                  width: blockWidth * 3,
                ),
                Text(
                  "Plane".toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            );
          } else if (vehicleType == 4) {
            return Row(
              children: [
                Icon(
                  FontAwesomeIcons.shuttleVan,
                ),
                SizedBox(
                  width: blockWidth * 3,
                ),
                Text(
                  "VAn".toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            );
          } else if (vehicleType == 5) {
            return Row(
              children: [
                Icon(
                  FontAwesomeIcons.motorcycle,
                ),
                SizedBox(
                  width: blockWidth * 3,
                ),
                Text(
                  "Bike".toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                Icon(
                  FontAwesomeIcons.bus,
                ),
                SizedBox(
                  width: blockWidth * 3,
                ),
                Text(
                  "other".toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
