import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class NeedInsuranceProtection extends StatefulWidget {
  NeedInsuranceProtection({this.onChoiceSelected});
  final Function(int) onChoiceSelected;

  @override
  _NeedInsuranceProtectionState createState() =>
      _NeedInsuranceProtectionState();
}

class _NeedInsuranceProtectionState extends State<NeedInsuranceProtection> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  int needInsurance;
//if this variable is 0  it means he needs insurance

  setSelectedRadioTile(int val) {
    setState(() {
      needInsurance = val;
      // print(needInsurance);
    });
    widget.onChoiceSelected(needInsurance);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      margin: EdgeInsets.all(
        0,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      child: Container(
        height: blockHeight * 12,
        // color: Colors.redAccent,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: blockHeight * 4,
              // color: Colors.yellow,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 2.5,
                // color: Colors.yellow,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: blockHeight,
                ),
                child: AutoSizeText(
                  "Need insurance protection ?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Globals.mainColor,
                  ),
                  minFontSize: 12,
                ),
              ),
            ),
            Container(
              height: blockHeight * 8,
              // color: Colors.orange,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 6,
                // color: Colors.redAccent,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                      height: blockHeight * 6,
                      width: blockWidth * 40,
                      child: RadioListTile(
                        dense: false,
                        value: 0,
                        groupValue: needInsurance,
                        title: Text(
                          "Yes",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onChanged: (val) {
                          // print("Radio Tile pressed $val");
                          setSelectedRadioTile(val);
                        },
                        activeColor: Globals.mainColor,
                        selected: needInsurance == 0,
                      ),
                    ),
                    Container(
                      height: blockHeight * 6,
                      width: blockWidth * 40,
                      child: RadioListTile(
                        dense: false,
                        value: 1,
                        groupValue: needInsurance,
                        title: Text(
                          "No",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onChanged: (val) {
                          // print("Radio Tile pressed $val");
                          setSelectedRadioTile(val);
                        },
                        activeColor: Globals.mainColor,
                        selected: needInsurance == 1,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
