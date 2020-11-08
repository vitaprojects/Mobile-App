import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/features/send_package/data/PackageModel.dart';
import 'package:newpostman1/features/send_package/presentation/SendPackageViewModel.dart';
import 'package:newpostman1/ui/AvailablePostman.dart';
import 'package:newpostman1/ui/PaymentPage.dart';
import 'package:newpostman1/ui/ThankYouWidget.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';
import 'ReceiverDetailsWidget.dart';
import 'SenderDetailsWidget.dart';

class SendPackageForm3 extends StatelessWidget {
  SendPackageForm3();

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  // final PackageModel packageModelFromForm2;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SendPackageViewModel>.nonReactive(
        builder: (context, model, child) {
          return Column(
            children: [
              Container(
                height: blockHeight * 5,
                // color: Colors.green,
              ),
              SenderDetails(),
              SizedBox(
                height: blockHeight * 2,
              ),
              ReceiverDetailsWidget(),
              SizedBox(
                height: blockHeight * 2,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: blockWidth * 5,
                ),
                child: CustomInputField(
                  attribute: "deliveryNote",
                  labelText: "Enter note for postman",
                  isDescription: true,
                ),
              ),
              SizedBox(
                height: blockHeight * 5,
              ),
              FormButton(
                buttonText: "find Postman",
                ontapFun: () {
                  // Get.to(PackageListedMessage());
                  Get.to(AvailablePostman());
                },
              ),
              SizedBox(
                height: blockHeight * 10,
              ),
            ],
          );
        },
        viewModelBuilder: () => SendPackageViewModel());
  }
}
