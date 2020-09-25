import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/NeedInsuranceProtectionWidget.dart';
import 'package:newpostman1/customWidgets/UploadPhotosForSendPackage.dart';

import '../globals.dart';

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
        Container(
          // height: blockHeight * 30,
          color: Colors.yellow,
          margin: EdgeInsets.symmetric(
            horizontal: blockWidth * 5,
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              CustomInputField(
                attribute: "Item Name",
                labelText: "Enter item name",
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
              CustomInputField(
                attribute: "item value",
                labelText: "Enter item value",
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
              NeedInsuranceProtection(
                onChoiceSelected: (val) {
                  print(val);
                },
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
