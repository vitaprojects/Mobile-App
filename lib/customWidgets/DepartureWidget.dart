import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../globals.dart';
import 'ICanPickUpWidget.dart';

class DepartureWidget extends StatefulWidget {
  DepartureWidget({
    this.travelType,
    this.onChoiceSelected,
  });
  final int travelType;
  final Function(bool) onChoiceSelected;

  @override
  _DepartureWidgetState createState() => _DepartureWidgetState();
}

class _DepartureWidgetState extends State<DepartureWidget> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: blockHeight * 50,
      color: Colors.red,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      child: Column(
        children: [
          Container(
            height: blockHeight * 5,
            color: Colors.yellow,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: blockWidth * 3,
              // top: blockHeight,
              // bottom: blockHeight,
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              height: blockHeight * 2.5,
              // color: Colors.blueAccent,
              child: AutoSizeText(
                "Departure".toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  color: Globals.mainColor,
                ),
                minFontSize: 12,
              ),
            ),
          ),
          (widget.travelType == 0 || widget.travelType == 3)
              ? Container()
              : ICanPickUpWidget(
                  onChoiceSelected: (bool val) {
                    // canPickUp = val;
                    // print(canPickUp);
                    widget.onChoiceSelected(val);
                  },
                ),
          Container(
            height: blockHeight * 10,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
