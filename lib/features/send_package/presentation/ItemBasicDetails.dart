import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/features/send_package/presentation/NeedInsuranceProtectionWidget.dart';
import 'package:newpostman1/features/send_package/presentation/SendPackageViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

class ItemBasicDetails extends ViewModelWidget<SendPackageViewModel> {
  ItemBasicDetails({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context, SendPackageViewModel model) {
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
            textEditingController: model.getItemName,
          ),
          SizedBox(
            height: blockHeight * 2,
          ),
          CustomInputField(
            attribute: "item value",
            labelText: "Enter item value",
            textEditingController: model.getItemValue,
            isPhone: true,
          ),
          SizedBox(
            height: blockHeight * 2,
          ),
          NeedInsuranceProtection(
            onChoiceSelected: (val) {
              print(val);
              model.setInsuranceProtected(val);
            },
          ),
          SizedBox(
            height: blockHeight * 2,
          ),
          CustomInputField(
            attribute: "itemDes",
            isDescription: true,
            labelText: "Enter item description",
            textEditingController: model.getItemDescription,
          ),
        ],
      ),
    );
  }
}
