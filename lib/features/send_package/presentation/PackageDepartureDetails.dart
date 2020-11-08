import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/LocationSelectButton.dart';
import 'package:newpostman1/features/send_package/presentation/SendPackageViewModel.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

class PackageDepartureDetails extends ViewModelWidget<SendPackageViewModel> {
  const PackageDepartureDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, SendPackageViewModel model) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Card(
      elevation: 20,
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      child: Container(
        // height: blockHeight * 30,

        // color: Colors.yellow,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: blockHeight * 5,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 2.5,
                // color: Colors.blue,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: blockHeight,
                ),
                child: AutoSizeText(
                  "Package drop off / departing point".toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Globals.mainColor,
                  ),
                  minFontSize: 12,
                ),
              ),
            ),
            Divider(
              height: blockHeight,
              thickness: blockHeight / 2,
            ),
            CustomInputField(
              textEditingController: model.getDepartureDateTimeController,
              attribute: "departureDateTime",
              isInternalField: true,
              labelText: "Enter date and Time",
              isDate: true,
            ),
            Divider(
              height: blockHeight,
              thickness: blockHeight / 2,
            ),
            LocationSelectButton(
              labelText: "Departing from ?",
              removeLocation: () {
                model.clearDepartingLocation();
              },
              attribute: "departurePoint",
              locationModel: model.departurelocationModel,
              onLocationSelected: (LocationModel locationModel) {
                model.setValuesForDepartingLocation(locationModel.latitude,
                    locationModel.longitude, locationModel.address);
              },
            ),
          ],
        ),
      ),
    );
  }
}
