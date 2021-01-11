import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/send_package/presentation/EnterWeightAndDimensions.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/features/send_package/presentation/ItemBasicDetails.dart';
import 'package:newpostman1/features/send_package/presentation/UploadPhotosForSendPackage.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';
import 'SendPackageSecondPage.dart';
import 'SendPackageViewModel.dart';

class SendPackageForm1 extends StatelessWidget {
  SendPackageForm1({Key key}) : super(key: key);

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SendPackageViewModel>.nonReactive(
        disposeViewModel: false,
        builder: (context, model, child) {
          return Column(
            children: [
              Container(
                height: blockHeight * 5,
                // color: Colors.green,
              ),
              UploadPhotosForSendPackage(),
              SizedBox(
                height: blockHeight * 2,
              ),
              ItemBasicDetails(), //pass the text controllers and a callback function to pass the variable to the main widget
              SizedBox(
                height: blockHeight * 2,
              ),
              EnterWeightAndDimenstions(
                  // onChoiceSelected: (val) {
                  //   print(val);
                  // },
                  ),
              SizedBox(
                height: blockHeight * 5,
              ),
              FormButton(
                buttonText: "next",
                ontapFun: () {
                  // Get.to(SendPackageSecondPage());
                  model.submitValuesInForm1(context);
                },
              ),
              Container(
                height: blockHeight * 10,
                // color: Colors.yellow,
              ),
            ],
          );
        },
        viewModelBuilder: () => SendPackageViewModel());
  }
}
