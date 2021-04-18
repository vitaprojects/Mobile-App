import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/post_itinerary/presentation/are_you_a_dpc.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/features/post_itinerary/presentation/departure_details_widget.dart';
import 'package:newpostman1/features/post_itinerary/presentation/post_your_itinerary_form_view_model.dart';
import 'package:newpostman1/features/post_itinerary/presentation/select_travel_type.dart';
import 'package:newpostman1/features/post_itinerary/presentation/upload_plane_ticket.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';
import 'destination_details_widget.dart';

class PostYourItineraryFormView extends StatelessWidget {
  PostYourItineraryFormView({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostYourItineraryFormViewModel>.reactive(
        builder: (context, model, child) {
          return Column(
            children: [
              SizedBox(
                height: blockHeight * 5,
              ),
              SelectTravelType(
                onChoiceSelected: (int val) {
                  // print(val);
                  // setState(() {
                  //   travelType = val;
                  // });
                  model.setTravelType(val);
                },
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (model.getTravelType == 0) {
                    ///if the travel type is bus we display this widget
                    return AreYouADPC(
                      onChoiceSelected: (int val) {
                        // driverPassengerOrCon = val;
                        model.setDriverPassengerOrCon(val);
                        // print(driverPassengerOrCon);
                      },
                    );
                  } else if (model.getTravelType == 3) {
                    ///if the travel type is plane we display this widget
                    return Column(
                      children: [
                        UploadPlaneTicketWidget(),
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
                              ///This input field is added to get the flight number
                              CustomInputField(
                                attribute: "flightNo",
                                labelText: "enter flight number",
                                textEditingController: model.getFlightNumber,
                              ),
                              SizedBox(
                                height: blockHeight * 2,
                              ),

                              ///This input field is added to get the airline number

                              CustomInputField(
                                attribute: "airlineno",
                                labelText: "enter airline number",
                                textEditingController: model.getAirlineNumber,
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
              (model.getTravelType == 0)
                  ? SizedBox(
                      height: blockHeight * 2,
                    )
                  : Container(),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (model.getTravelType != 3) {
                    return Container(
                      height: blockHeight * 36,
                      // color: Colors.red,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                        horizontal: blockWidth * 5,
                      ),
                      child: Column(
                        children: [
                          ///This input field is added to get the vehicle number

                          CustomInputField(
                            textEditingController: model.vehicleIdentification,
                            attribute: "vehiNo",
                            labelText: "vehicle identification",
                          ),
                          SizedBox(
                            height: blockHeight * 2,
                          ),

                          ///This input field is added to get the transport company

                          CustomInputField(
                            textEditingController: model.transportCompany,
                            attribute: "transportComp",
                            labelText: "transport company",
                          ),
                          SizedBox(
                            height: blockHeight * 2,
                          ),

                          ///This input field is added to get the license plate number

                          CustomInputField(
                            textEditingController: model.licencePlateNumber,
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
              DepartureDetailsWidget(
                travelType: model.getTravelType,
                // onChoiceSelected: (bool val) {
                //   // canPickUp = val;
                //   // print(canPickUp);
                //   // model.setCanPickUp(val);
                // },
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
              DestinationWidget(
                travelType: model.getTravelType,
                onChoiceSelected: (bool val) {
                  // canDeliver = val;
                  // print(canDeliver);
                  model.setCanDeliver(val);
                },
              ),
              SizedBox(
                height: blockHeight * 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: blockWidth * 5,
                ),
                child: RaisedButton(
                  color: Globals.mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    20,
                  )),
                  onPressed: () {
                    // Get.off(ThankYouWidget());
                    model.submitForm();
                  },
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: blockHeight * 6,
                    // color: Colors.red,
                    alignment: Alignment.center,
                    child: Container(
                      height: blockHeight * 3,
                      // color: Colors.yellow,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "next - go live".toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        minFontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: blockHeight * 10,
                // color: Colors.yellow,
              ),
            ],
          );
        },
        viewModelBuilder: () => PostYourItineraryFormViewModel());
  }
}
