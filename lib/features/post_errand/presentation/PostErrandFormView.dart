import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/customWidgets/LocationSelectButton.dart';
import 'package:newpostman1/features/MyPackages/presentation/PostedPackagesViewModel.dart';
import 'package:newpostman1/features/post_errand/presentation/PostErrandFormViewModel.dart';
import 'package:newpostman1/features/post_errand/presentation/UploadedImagesOfPackage.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/ui/ThankYouWidget.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

class PostYourErrandFormView extends ViewModelWidget<PostErrandFormViewModel> {
  PostYourErrandFormView({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  // double margin;

  @override
  Widget build(BuildContext context, PostErrandFormViewModel model) {
    // margin = blockWidth * 5;
    return Column(
      children: [
        Container(
          height: blockHeight * 5,
          // color: Colors.green,
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            10,
          )),
          elevation: 20,
          margin: EdgeInsets.symmetric(
            horizontal: model.margin,
          ),
          child: Container(
            // color: Colors.yellow,
            alignment: Alignment.center,
            child: Column(
              children: [
                CustomInputField(
                  textEditingController: model.getpickUpStore,
                  attribute: "pickupPlace",
                  isInternalField: true,
                  labelText: "Pickup from e.g Walmart",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  textEditingController: model.getGroceryType,
                  attribute: "pickupType",
                  isInternalField: true,
                  labelText: "Pickup type e.g Grocery",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                LocationSelectButton(
                  labelText: "Pickup Address ?",
                  removeLocation: () {
                    model.clearPickUpLocation();
                  },
                  attribute: "departurePoint",
                  locationModel: model.pickUplocationModel,
                  onLocationSelected: (LocationModel locationModel) {
                    model.setValuesForPickUpLocation(locationModel.latitude,
                        locationModel.longitude, locationModel.address);
                  },
                ),
                // CustomInputField(
                //   attribute: "pickupLocation",
                //   isInternalField: true,
                //   labelText: "Pickup address",
                // ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  textEditingController: model.getpickUpPhone,
                  attribute: "pickupPhone",
                  isInternalField: true,
                  isPhone: true,
                  labelText: "Pickup or Store phone#",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  textEditingController: model.getOrderNo,
                  attribute: "orderID",
                  isInternalField: true,
                  labelText: "Order Number (optional)",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                LocationSelectButton(
                  labelText: "Drop off Address ?",
                  removeLocation: () {
                    model.clearDropOffLocation();
                  },
                  attribute: "destinationPoint",
                  locationModel: model.dropOfflocationModel,
                  onLocationSelected: (LocationModel locationModel) {
                    model.setValuesForDropOffLocation(locationModel.latitude,
                        locationModel.longitude, locationModel.address);
                  },
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  textEditingController: model.getInstructions,
                  attribute: "pickup",
                  isInternalField: true,
                  isDescription: true,
                  labelText: "Add instruction for driver",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  textEditingController: model.getMyAmount,
                  attribute: "myoffer",
                  isInternalField: true,
                  isPhone: true,
                  labelText: "I Will pay (Min \$9.99)",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  textEditingController: model.getMyTip,
                  attribute: "mytip",
                  isInternalField: true,
                  isPhone: true,
                  labelText: "My Tip (Min \$2.99)",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                // CustomInputField(
                //   textEditingController: model.getMyTotalOffer,
                //   attribute: "myoffer",
                //   isInternalField: true,
                //   isPhone: true,
                //   labelText: "My total offer (\$13.24)",
                // ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: blockHeight * 3,
        ),
        UploadedImagesOfPackage(),
        SizedBox(
          height: blockHeight * 5,
        ),
        FormButton(
          buttonText: "post your errand",
          ontapFun: () {
            // Get.off(ThankYouWidget(
            //   typeOfThankYou: 2,
            // ));
            model.submitValuesInForm();
          },
        ),
        SizedBox(
          height: blockHeight * 5,
        ),
      ],
    );
  }
}
