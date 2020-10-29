import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';

import '../../../globals.dart';
import 'PackageDepartureDetails.dart';
import 'PackageFinalDestDetails.dart';
import 'SendPackageThirdPage.dart';

class SendPackageForm2 extends StatefulWidget {
  SendPackageForm2({Key key}) : super(key: key);

  @override
  _SendPackageForm2State createState() => _SendPackageForm2State();
}

class _SendPackageForm2State extends State<SendPackageForm2> {
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
        PackageDepartureDetails(),
        SizedBox(
          height: blockHeight * 2,
        ),
        PackageFinalDestDetails(),
        // SizedBox(
        //   height: blockHeight * 2,
        // ),
        // Container(
        //   margin: EdgeInsets.symmetric(
        //     horizontal: blockWidth * 5,
        //   ),
        //   child: CustomInputField(
        //     attribute: "postageCost",
        //     labelText: "Enter postage cost",
        //   ),
        // ),
        SizedBox(
          height: blockHeight * 5,
        ),
        FormButton(
          buttonText: "next",
          ontapFun: () {
            Get.to(SendPackageThirdPage());
          },
        ),
        SizedBox(
          height: blockHeight * 10,
        ),
      ],
    );
  }
}
