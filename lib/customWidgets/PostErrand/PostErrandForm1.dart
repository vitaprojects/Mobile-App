import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/customWidgets/SendPackage/UploadedImagesOfPackage.dart';
import 'package:newpostman1/ui/ThankYouWidget.dart';

import '../../globals.dart';

class PostYourErrandForm1 extends StatelessWidget {
  PostYourErrandForm1({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  double margin;

  @override
  Widget build(BuildContext context) {
    margin = blockWidth * 5;
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
            horizontal: margin,
          ),
          child: Container(
            // color: Colors.yellow,
            alignment: Alignment.center,
            child: Column(
              children: [
                CustomInputField(
                  attribute: "pickupPlace",
                  isInternalField: true,
                  labelText: "Enter pickup store , place , company",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  attribute: "pickupType",
                  isInternalField: true,
                  labelText: "Enter pickup type",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  attribute: "pickupLocation",
                  isInternalField: true,
                  labelText: "Enter full address of pickup location",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  attribute: "pickupPhone",
                  isInternalField: true,
                  isPhone: true,
                  labelText: "Enter phone number of pickup place",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  attribute: "orderID",
                  isInternalField: true,
                  labelText: "Enter order id if avaialable",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  attribute: "dropAddress",
                  isInternalField: true,
                  labelText: "Enter drop off address",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  attribute: "pickup",
                  isInternalField: true,
                  isDescription: true,
                  labelText: "Enter additional note for driver",
                ),
                Divider(
                  height: blockHeight / 2,
                  thickness: blockHeight / 4,
                ),
                CustomInputField(
                  attribute: "myoffer",
                  isInternalField: true,
                  isPhone: true,
                  labelText: "Enter your offer",
                ),
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
            Get.off(ThankYouWidget(
              typeOfThankYou: 2,
            ));
          },
        ),
        SizedBox(
          height: blockHeight * 5,
        ),
      ],
    );
  }
}