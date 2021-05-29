import 'package:flutter/material.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/useful/globals.dart';

class ViewItemLocationButton extends StatelessWidget {
  ViewItemLocationButton({@required this.buttonTitle, @required this.callback});
  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;

  final double margin = Globals.blockWidth * 5;
  final String buttonTitle;

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Globals.mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        callback();
      },
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
