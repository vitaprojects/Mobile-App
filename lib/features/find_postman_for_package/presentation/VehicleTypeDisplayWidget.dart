import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/useful/globals.dart';

class VehicleTypeDisplayWidget extends StatelessWidget {
  VehicleTypeDisplayWidget({
    @required this.travelType,
  });
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final String travelType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: blockHeight * 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            width: blockWidth * 30,
            // color: Colors.yellow,
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (travelType == "0") {
                  return Icon(
                    FontAwesomeIcons.bus,
                  );
                } else if (travelType == "1") {
                  return Icon(
                    FontAwesomeIcons.car,
                  );
                } else if (travelType == "2") {
                  return Icon(
                    FontAwesomeIcons.truck,
                  );
                } else if (travelType == "3") {
                  return Icon(
                    FontAwesomeIcons.plane,
                  );
                } else if (travelType == "4") {
                  return Icon(
                    FontAwesomeIcons.shuttleVan,
                  );
                } else if (travelType == "5") {
                  return Icon(
                    FontAwesomeIcons.motorcycle,
                  );
                } else if (travelType == "6") {
                  return Icon(
                    FontAwesomeIcons.busAlt,
                  );
                } else {
                  return Icon(
                    FontAwesomeIcons.bus,
                  );
                }
              },
            ),
          ),
          SizedBox(
            width: blockWidth * 5,
          ),
          Expanded(
            child: Container(
              // color: Colors.yellow,
              alignment: Alignment.centerLeft,
              // child: Text(
              //   "Car".toUpperCase(),
              //   style: TextStyle(
              //     fontSize: 18,
              //   ),
              // ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (travelType == "0") {
                    return Text("Bus".toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                        ));
                  } else if (travelType == "1") {
                    return Text("Car".toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                        ));
                  } else if (travelType == "2") {
                    return Text("Truck".toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                        ));
                  } else if (travelType == "3") {
                    return Text("Plane".toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                        ));
                  } else if (travelType == "4") {
                    return Text("Van".toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                        ));
                  } else if (travelType == "5") {
                    return Text("Bike".toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                        ));
                  } else if (travelType == "6") {
                    return Text("Threewheel".toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                        ));
                  } else {
                    return Text("Other".toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                        ));
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
