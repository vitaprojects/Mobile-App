import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/NeedInsuranceProtectionWidget.dart';

import '../globals.dart';

class ItemBasicDetails extends StatefulWidget {
  ItemBasicDetails({Key key}) : super(key: key);

  @override
  _ItemBasicDetailsState createState() => _ItemBasicDetailsState();
}

class _ItemBasicDetailsState extends State<ItemBasicDetails> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Container(
      // height: blockHeight * 30,
      // color: Colors.yellow,
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
          CustomInputField(
            attribute: "itemDes",
            isDescription: true,
            labelText: "Enter item description",
          ),
        ],
      ),
    );
  }
}
