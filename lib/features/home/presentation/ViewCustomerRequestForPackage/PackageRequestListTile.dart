import 'package:flutter/material.dart';
import 'package:newpostman1/useful/globals.dart';

class PackageRequestListTile extends StatelessWidget {
  PackageRequestListTile({
    @required this.labelText,
    @required this.value,
  });
  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;
  final double margin = Globals.blockWidth * 5;
  final String labelText;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      margin: EdgeInsets.symmetric(
        horizontal: margin,
      ),
      elevation: 10,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 2,
          vertical: blockHeight,
        ),
        //height: blockHeight * 6,
        // color: Colors.greenAccent,

        alignment: Alignment.centerLeft,
        child: Container(
          // color: Colors.yellow,
          alignment: Alignment.centerLeft,
          child: Text(
            "$labelText : $value",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
