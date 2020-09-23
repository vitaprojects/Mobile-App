import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:newpostman1/customWidgets/AreYouADPC.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/DepartureWidget.dart';
import 'package:newpostman1/customWidgets/ICanPickUpWidget.dart';
import 'package:newpostman1/customWidgets/SelectTravelType.dart';
import 'package:newpostman1/customWidgets/UploadPlaneTicket.dart';

import '../globals.dart';

class PostYourItenaryForm1 extends StatefulWidget {
  PostYourItenaryForm1({Key key}) : super(key: key);

  @override
  _PostYourItenaryForm1State createState() => _PostYourItenaryForm1State();
}

class _PostYourItenaryForm1State extends State<PostYourItenaryForm1> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  Color chipColor = Colors.white;
  int travelType;
  int driverPassengerOrCon; //the type of the user
  bool canPickUp; //whether the user can pcikup or not

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: blockHeight * 5,
        ),
        SelectTravelType(
          onChoiceSelected: (int val) {
            print(val);
            setState(() {
              travelType = val;
            });
          },
        ),
        SizedBox(
          height: blockHeight * 2,
        ),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (travelType == 0) {
              return AreYouADPC(
                onChoiceSelected: (int val) {
                  driverPassengerOrCon = val;
                  print(driverPassengerOrCon);
                },
              );
            } else if (travelType == 3) {
              return Column(
                children: [
                  UploadPlaneTicketWidget(), //TODO implemente a callback function to get the image file uploaded by the user
                  SizedBox(
                    height: blockHeight * 2,
                  ),
                  Container(
                    height: blockHeight * 24,
                    // color: Colors.yellow,
                    margin: EdgeInsets.symmetric(
                      horizontal: blockWidth * 5,
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        CustomInputField(
                          attribute: "flightNo",
                          labelText: "enter flight number",
                          textEditingController: TextEditingController(),
                        ),
                        SizedBox(
                          height: blockHeight * 2,
                        ),
                        CustomInputField(
                          attribute: "airlineno",
                          labelText: "enter airline number",
                          textEditingController: TextEditingController(),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
        (travelType == 0)
            ? SizedBox(
                height: blockHeight * 2,
              )
            : Container(),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (travelType != 3) {
              return Container(
                height: blockHeight * 36,
                // color: Colors.red,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  horizontal: blockWidth * 5,
                ),
                child: Column(
                  children: [
                    CustomInputField(
                      attribute: "vehiNo",
                      labelText: "vehicle identification",
                    ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    CustomInputField(
                      attribute: "transportComp",
                      labelText: "transport company",
                    ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    CustomInputField(
                      attribute: "licencePlate",
                      labelText: "enter licence plate number",
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        // LayoutBuilder(
        //   builder: (BuildContext context, BoxConstraints constraints) {
        //     if (travelType == 0 || travelType == 3) {
        //       return Container();
        //     } else {
        //       return ICanPickUpWidget(
        //         onChoiceSelected: (bool val) {
        //           canPickUp = val;
        //           print(canPickUp);
        //         },
        //       );
        //     }
        //   },
        // ),
        DepartureWidget(
          travelType: travelType,
          onChoiceSelected: (bool val) {
            canPickUp = val;
            print(canPickUp);
          },
        ),

        SizedBox(
          height: blockHeight * 2,
        ),
        Container(
          height: blockHeight * 50,
          color: Colors.yellow,
        ),
      ],
    );
  }
}