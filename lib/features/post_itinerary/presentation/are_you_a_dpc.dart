import 'package:flutter/material.dart';

import '../../../useful/globals.dart';

class AreYouADPC extends StatefulWidget {
  ///this widget is used to ask from the user are you a [`driver`], [`conductor`] or a  [`passenger`]

  AreYouADPC({this.onChoiceSelected});
  final Function(int) onChoiceSelected;

  @override
  _AreYouADPCState createState() => _AreYouADPCState();
}

class _AreYouADPCState extends State<AreYouADPC> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  int selectedType;

  setSelectedRadioTile(int val) {
    setState(() {
      selectedType = val;
    });
    widget.onChoiceSelected(selectedType);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        20,
      )),
      elevation: 20,
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      child: Container(
        height: blockHeight * 22,
        // color: Colors.green,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 2,
          vertical: blockHeight * 1,
        ),
        child: SizedBox.expand(
          child: Container(
            // color: Colors.yellow,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: blockHeight * 5,
                  // color: Colors.orange,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "are you a (driver-passenger-conductor)".toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                    height: blockHeight * 15,
                    // color: Colors.green,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RadioListTile(
                            dense: false,
                            value: 0,
                            groupValue: selectedType,
                            title: Text(
                              "Driver",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onChanged: (val) {
                              // print("Radio Tile pressed $val");
                              setSelectedRadioTile(val);
                            },
                            activeColor: Globals.mainColor,
                            selected: selectedType == 0,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            dense: false,
                            value: 1,
                            groupValue: selectedType,
                            title: Text(
                              "Passenger",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onChanged: (val) {
                              // print("Radio Tile pressed $val");
                              setSelectedRadioTile(val);
                            },
                            activeColor: Globals.mainColor,
                            selected: selectedType == 1,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            dense: false,
                            value: 2,
                            groupValue: selectedType,
                            title: Text(
                              "Conductor",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onChanged: (val) {
                              // print("Radio Tile pressed $val");
                              setSelectedRadioTile(val);
                            },
                            activeColor: Globals.mainColor,
                            selected: selectedType == 2,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
