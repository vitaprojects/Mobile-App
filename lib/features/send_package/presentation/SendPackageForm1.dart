import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/send_package/presentation/EnterWeightAndDimensions.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/features/send_package/presentation/ItemBasicDetails.dart';
import 'package:newpostman1/features/send_package/presentation/UploadPhotosForSendPackage.dart';

import '../../../useful/globals.dart';
import 'SendPackageSecondPage.dart';

class SendPackageForm1 extends StatefulWidget {
  SendPackageForm1({Key key}) : super(key: key);

  @override
  _SendPackageForm1State createState() => _SendPackageForm1State();
}

class _SendPackageForm1State extends State<SendPackageForm1> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: blockHeight * 5,
          // color: Colors.green,
        ),
        UploadPhotosForSendPackage(), //TODO add a fucntion which returns the images added from this widget a callback function
        SizedBox(
          height: blockHeight * 2,
        ),
        ItemBasicDetails(), //pass the text controllers and a callback function to pass the variable to the main widget
        SizedBox(
          height: blockHeight * 2,
        ),
        EnterWeightAndDimenstions(
          onChoiceSelected: (val) {
            print(val);
          },
        ),
        SizedBox(
          height: blockHeight * 5,
        ),
        FormButton(
          buttonText: "next",
          ontapFun: () {
            Get.to(SendPackageSecondPage());
          },
        ),
        Container(
          height: blockHeight * 10,
          // color: Colors.yellow,
        ),
      ],
    );
  }
}
