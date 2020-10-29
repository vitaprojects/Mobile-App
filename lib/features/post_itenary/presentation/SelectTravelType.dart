import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../useful/globals.dart';

class SelectTravelType extends StatefulWidget {
  SelectTravelType({@required this.onChoiceSelected});
  final Function(int) onChoiceSelected;

  @override
  _SelectTravelTypeState createState() => _SelectTravelTypeState();
}

class _SelectTravelTypeState extends State<SelectTravelType> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  List<bool> transPortationChoices = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  selectType(
    int index,
  ) {
    for (var i = 0; i < transPortationChoices.length; i++) {
      if (i == index) {
        print("inside if");
        setState(() {
          transPortationChoices[index] = true;
          widget.onChoiceSelected(index);
        });
      } else {
        transPortationChoices[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        20,
      )),
      child: Container(
        height: blockHeight * 25,
        // color: Colors.yellow,

        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 2,
          vertical: blockHeight * 2,
        ),
        child: SizedBox.expand(
          child: Container(
            // color: Colors.green,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: blockHeight * 5,
                  // color: Colors.redAccent,
                  alignment: Alignment.center,
                  child: Container(
                    height: blockHeight *
                        2.5, //TODO the height of a title in this for is 2.5*blockHeight
                    // color: Colors.orange,
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      "select travel type".toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Globals.mainColor,
                      ),
                      minFontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  // color: Colors.orange,
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: blockWidth,
                    // runSpacing: blockHeight,
                    alignment: WrapAlignment.center,
                    children: [
                      ChoiceChip(
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        label: Text("Bus"),
                        selected: transPortationChoices[0] == true,
                        selectedColor: Globals.mainColor,
                        onSelected: (value) {
                          print(value);
                          if (value == true) {
                            selectType(0);
                          }
                        },
                        avatar: Container(
                          margin: EdgeInsets.only(
                            left: blockWidth,
                          ),
                          height: blockHeight * 3,
                          width: blockHeight * 3,
                          // color: Colors.red,
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.bus,
                            size: blockHeight * 3,
                          ),
                        ),
                      ),
                      ChoiceChip(
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        label: Text("Car"),
                        selected: transPortationChoices[1] == true,
                        selectedColor: Globals.mainColor,
                        onSelected: (value) {
                          print(value);
                          if (value == true) {
                            selectType(1);
                          }
                        },
                        avatar: Container(
                          margin: EdgeInsets.only(
                            left: blockWidth,
                          ),
                          height: blockHeight * 3,
                          width: blockHeight * 3,
                          // color: Colors.red,
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.car,
                            size: blockHeight * 3,
                          ),
                        ),
                      ),
                      ChoiceChip(
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        label: Text("Truck"),
                        selected: transPortationChoices[2] == true,
                        selectedColor: Globals.mainColor,
                        onSelected: (value) {
                          print(value);
                          if (value == true) {
                            selectType(2);
                          }
                        },
                        avatar: Container(
                          margin: EdgeInsets.only(
                            left: blockWidth,
                          ),
                          height: blockHeight * 3,
                          width: blockHeight * 3,
                          // color: Colors.red,
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.truck,
                            size: blockHeight * 3,
                          ),
                        ),
                      ),
                      ChoiceChip(
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        label: Text("Plane"),
                        selected: transPortationChoices[3] == true,
                        selectedColor: Globals.mainColor,
                        onSelected: (value) {
                          print(value);
                          if (value == true) {
                            selectType(3);
                          }
                        },
                        avatar: Container(
                          margin: EdgeInsets.only(
                            left: blockWidth,
                          ),
                          height: blockHeight * 3,
                          width: blockHeight * 3,
                          // color: Colors.red,
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.planeDeparture,
                            size: blockHeight * 3,
                          ),
                        ),
                      ),
                      ChoiceChip(
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        label: Text("Van"),
                        selected: transPortationChoices[4] == true,
                        selectedColor: Globals.mainColor,
                        onSelected: (value) {
                          print(value);
                          if (value == true) {
                            selectType(4);
                          }
                        },
                        avatar: Container(
                          margin: EdgeInsets.only(
                            left: blockWidth,
                          ),
                          height: blockHeight * 3,
                          width: blockHeight * 3,
                          // color: Colors.red,
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.shuttleVan,
                            size: blockHeight * 3,
                          ),
                        ),
                      ),
                      ChoiceChip(
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        label: Text("Bike"),
                        selected: transPortationChoices[5] == true,
                        selectedColor: Globals.mainColor,
                        onSelected: (value) {
                          print(value);
                          if (value == true) {
                            selectType(5);
                          }
                        },
                        avatar: Container(
                          margin: EdgeInsets.only(
                            left: blockWidth,
                          ),
                          height: blockHeight * 3,
                          width: blockHeight * 3,
                          // color: Colors.red,
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.motorcycle,
                            size: blockHeight * 3,
                          ),
                        ),
                      ),
                      ChoiceChip(
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        label: Text("ThreeWheel"),
                        selected: transPortationChoices[6] == true,
                        selectedColor: Globals.mainColor,
                        onSelected: (value) {
                          print(value);
                          if (value == true) {
                            selectType(6);
                          }
                        },
                        avatar: Container(
                          margin: EdgeInsets.only(
                            left: blockWidth,
                          ),
                          height: blockHeight * 3,
                          width: blockHeight * 3,
                          // color: Colors.red,
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.car,
                            size: blockHeight * 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
