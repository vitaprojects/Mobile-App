import 'package:flutter/material.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/useful/globals.dart';

class ViewItemLocationButton extends StatelessWidget {
  ViewItemLocationButton({
    @required this.buttonTitle,
    @required this.locationModel,
  });
  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;

  final double margin = Globals.blockWidth * 5;
  final String buttonTitle;

  /// We pass this location model so we can load the map easily
  final LocationModel locationModel;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Globals.mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {},
      padding: EdgeInsets.all(0),
      child: Container(
        height: blockHeight * 10,
        // color: Colors.green,
        width: blockWidth * 40,
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
