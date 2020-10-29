import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';

import '../../../globals.dart';

class EnterWeightAndDimenstions extends StatefulWidget {
  EnterWeightAndDimenstions({
    this.onChoiceSelected,
  });
  final Function(int) onChoiceSelected;

  @override
  _EnterWeightAndDimenstionsState createState() =>
      _EnterWeightAndDimenstionsState();
}

class _EnterWeightAndDimenstionsState extends State<EnterWeightAndDimenstions> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  int parcelWeightType; //if this is 0 parcel type is== standard //else parcel type is ==parcel

  setSelectedRadioTile(int val) {
    setState(() {
      parcelWeightType = val;
    });
    widget.onChoiceSelected(parcelWeightType);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      child: Container(
        // color: Colors.yellow,
        // height: blockHeight * 30,

        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: blockHeight * 5,
              // color: Colors.greenAccent,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 2.5,
                // color: Colors.yellow,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: blockHeight,
                ),
                child: AutoSizeText(
                  "Select weight & enter dimenstions below".toUpperCase(),
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
              height: blockHeight * 5,
              // color: Colors.orange,
              alignment: Alignment.centerLeft,
              child: Container(
                height: blockHeight * 2.5,
                // color: Colors.yellow,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: blockHeight,
                ),
                child: AutoSizeText(
                  "weight".toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      color: Globals.mainColor,
                      fontWeight: FontWeight.w600),
                  minFontSize: 12,
                ),
              ),
            ),
            Container(
              height: blockHeight * 10,
              // color: Colors.redAccent,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 4,
                // color: Colors.yellow,
                alignment: Alignment.center,
                child: RadioListTile(
                  dense: false,
                  value: 0,
                  groupValue: parcelWeightType,
                  title: Text(
                    "Standard (0-5 kg)",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onChanged: (val) {
                    // print("Radio Tile pressed $val");
                    setSelectedRadioTile(val);
                  },
                  activeColor: Globals.mainColor,
                  selected: parcelWeightType == 0,
                ),
              ),
            ),
            Container(
              height: blockHeight * 10,
              // color: Colors.redAccent,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 4,
                // color: Colors.yellow,
                alignment: Alignment.center,
                child: RadioListTile(
                  dense: false,
                  value: 1,
                  groupValue: parcelWeightType,
                  title: Text(
                    "Parcel (5 kg plus)",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onChanged: (val) {
                    // print("Radio Tile pressed $val");
                    setSelectedRadioTile(val);
                  },
                  activeColor: Globals.mainColor,
                  selected: parcelWeightType == 1,
                ),
              ),
            ),
            SizedBox(
              height: blockHeight,
            ),
            Visibility(
              visible: parcelWeightType == 1,
              child: CustomInputField(
                attribute: "preciseWeight",
                labelText: "Enter precise weight",
                isInternalField: true,
              ),
            ),
            Divider(
              height: blockHeight,
              thickness: blockHeight / 2,
            ),
            // SizedBox(
            //   height: blockHeight * 2,
            // ),
            Container(
              height: blockHeight * 12,
              // color: Colors.orange,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    height: blockHeight * 5,
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
                        "Size / dimensions (in inch)".toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16,
                            color: Globals.mainColor,
                            fontWeight: FontWeight.w600),
                        minFontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.grey,
                      alignment: Alignment.center,
                      child: Container(
                        height: blockHeight * 5,
                        // color: Colors.yellow,
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            SizedBox(
                              width: blockWidth * 2,
                            ),
                            Expanded(
                              child: Container(
                                // color: Colors.green,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 0.5,
                                  color: Globals.mainColor,
                                )),
                                child: FormBuilderTextField(
                                  attribute: "length",
                                  textAlign: TextAlign.center,
                                  decoration:
                                      InputDecoration(hintText: "Length"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: blockWidth * 2,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 0.5,
                                  color: Globals.mainColor,
                                )),
                                child: FormBuilderTextField(
                                  textAlign: TextAlign.center,
                                  attribute: "width",
                                  decoration:
                                      InputDecoration(hintText: "Width"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: blockWidth * 2,
                            ),
                            Expanded(
                              child: Container(
                                // color: Colors.red,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 0.5,
                                  color: Globals.mainColor,
                                )),
                                child: FormBuilderTextField(
                                  textAlign: TextAlign.center,
                                  attribute: "height",
                                  decoration:
                                      InputDecoration(hintText: "Height"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: blockWidth * 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: blockHeight * 1,
            ),
          ],
        ),
      ),
    );
  }
}
