import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/LocationSelectButton.dart';
import 'package:newpostman1/features/post_itinerary/presentation/post_your_itinerary_form_view_model.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';
import 'i_can_pick_up_widget.dart';

class DepartureDetailsWidget
    extends ViewModelWidget<PostYourItineraryFormViewModel> {
  ///This widget was created to get the [`departure details`] of the [`itinerary`]
  DepartureDetailsWidget({
    this.travelType,
    // this.onChoiceSelected,
  });
  final int travelType;
  // final Function(bool) onChoiceSelected;

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context, PostYourItineraryFormViewModel model) {
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
                "Departure".toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  color: Globals.mainColor,
                ),
                minFontSize: 12,
              ),
            ),
          ),
          (travelType == 0 || travelType == 3)
              ? Container()
              : ICanPickUpWidget(
                  pickUp: true,
                  onChoiceSelected: (bool val) {
                    // canPickUp = val;
                    // print(canPickUp);
                    // onChoiceSelected(val);
                    model.setCanPickUp(val);
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
                controller: model.getDepartureDateAndTime,
                fieldHintText: "date and time",
                // inputType: InputType.date,
                format: DateFormat("yyyy-MM-dd HH:mm:ss"),

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
          LocationSelectButton(
            labelText: "Departing from ?",
            removeLocation: () {
              model.clearDepartingLocation();
            },
            attribute: "departurePoint",
            locationModel: model.departurelocationModel,
            onLocationSelected: (LocationModel locationModel) {
              model.setValuesForDepartingLocation(locationModel.latitude,
                  locationModel.longitude, locationModel.address);
            },
          ),
          // CustomInputField(
          //   textEditingController: model.getDepartingLocation,
          //   attribute: "departurePoint",
          //   labelText: "Departing from ?",
          // ),
          SizedBox(
            height: blockHeight * 2,
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (travelType == 3) {
                return Column(
                  children: [
                    CustomInputField(
                      textEditingController: model.getDepartureTerminal,
                      attribute: "departureTerminal",
                      labelText: "enter departure terminal".toUpperCase(),
                    ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    CustomInputField(
                      textEditingController: model.getDepartingAirport,
                      attribute: "departureAirport",
                      labelText: "enter departure airport".toUpperCase(),
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
