import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';

import '../globals.dart';
import 'ICanPickUpWidget.dart';

class DestinationWidget extends StatefulWidget {
  DestinationWidget({
    this.travelType,
    this.onChoiceSelected,
  });
  final int travelType;
  final Function(bool) onChoiceSelected;

  @override
  _DestinationWidgetState createState() => _DestinationWidgetState();
}

class _DestinationWidgetState extends State<DestinationWidget> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: blockHeight * 50,
      // color: Colors.red,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      child: Column(
        children: [
          Container(
            height: blockHeight * 5,
            // color: Colors.yellow,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: blockWidth * 3,
              // top: blockHeight,
              // bottom: blockHeight,
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              height: blockHeight * 2.5,
              // color: Colors.blueAccent,
              child: AutoSizeText(
                "destination".toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  color: Globals.mainColor,
                ),
                minFontSize: 12,
              ),
            ),
          ),
          (widget.travelType == 0 || widget.travelType == 3)
              ? Container()
              : ICanPickUpWidget(
                  pickUp: false,
                  onChoiceSelected: (bool val) {
                    // canPickUp = val;
                    // print(canPickUp);
                    widget.onChoiceSelected(val);
                  },
                ),
          SizedBox(
            height: blockHeight * 2,
          ),
          Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              10,
            )),
            margin: EdgeInsets.all(
              0,
            ),
            child: Container(
              height: blockHeight * 10,
              // color: Colors.red,
              padding: EdgeInsets.symmetric(
                horizontal: blockWidth * 3,
              ),
              alignment: Alignment.center,
              child: FormBuilderDateTimePicker(
                fieldHintText: "date and time",
                attribute: "departureDate",
                decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.only(
                    //   top: 0,
                    //   bottom: 0,
                    //   left: blockWidth * 3,
                    // )

                    labelStyle: TextStyle(
                      color: Globals.mainColor,
                    ),
                    labelText: "date and time".toUpperCase()),
                // fieldLabelText: "date and time".toUpperCase(),
              ),
            ),
          ),
          SizedBox(
            height: blockHeight * 2,
          ),
          CustomInputField(
            attribute: "destinationPoint",
            labelText: "Final stop",
          ),
          SizedBox(
            height: blockHeight * 2,
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (widget.travelType == 3) {
                return Column(
                  children: [
                    CustomInputField(
                      attribute: "arrivalTerminal",
                      labelText: "enter arrival terminal".toUpperCase(),
                    ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    CustomInputField(
                      attribute: "arrivalAirport",
                      labelText: "enter arrival airport".toUpperCase(),
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
