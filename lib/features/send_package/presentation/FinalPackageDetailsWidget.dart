import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/ui/TripDetailRowCard.dart';

import '../../../useful/globals.dart';

class FinalPackageDetailsWidget extends StatelessWidget {
  FinalPackageDetailsWidget({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      child: Container(
        // height: blockHeight * 50,
        // color: Colors.yellow,
        padding: EdgeInsets.all(
          blockHeight,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: blockHeight * 6,
              // color: Colors.green,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 4,
                // color: Colors.redAccent,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  "Package Details",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  minFontSize: 14,
                ),
              ),
            ),
            TripDetailRowCard(
              address: "130/a colombo colombo",
              date: "04 sep 2020",
              isDeparture: true,
            ),
            Divider(
              height: blockHeight,
              thickness: blockHeight / 2,
            ),
            TripDetailRowCard(
              address:
                  "19923 new york city abdsdlkskdl flfdlkfddddddddddddddddddddddddddddddddddddddxxx",
              date: "10 sep 2020",
              isDeparture: false,
            ),
            Divider(
              height: blockHeight,
              thickness: blockHeight / 2,
            ),
            Container(
              height: blockHeight * 8,
              // color: Colors.green,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 6,
                // color: Colors.redAccent,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(
                      width: blockWidth * 5,
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.grey,
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Container(
                              width: blockWidth * 12,
                              // color: Colors.greenAccent,
                              alignment: Alignment.center,
                              child: Icon(
                                FontAwesomeIcons.weightHanging,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              // color: Colors.redAccent,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      // color: Colors.yellow,
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        "Weight",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        minFontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      // color: Colors.yellow,
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        "Unknown",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                        minFontSize: 12,
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
                    Expanded(
                      child: Container(
                        // color: Colors.grey,
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Container(
                              width: blockWidth * 12,
                              // color: Colors.greenAccent,
                              alignment: Alignment.center,
                              child: Icon(
                                FontAwesomeIcons.shoppingBag,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              // color: Colors.redAccent,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      // color: Colors.yellow,
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        "Item Category",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        minFontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      // color: Colors.yellow,
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        "Unknown",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                        minFontSize: 12,
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
                    SizedBox(
                      width: blockWidth * 5,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: blockHeight,
              thickness: blockHeight / 2,
            ),
            CustomInputField(
              attribute: "size",
              isInternalField: true,
              labelText: "Size",
            ),
            Divider(
              height: blockHeight,
              thickness: blockHeight / 2,
            ),
            CustomInputField(
              attribute: "name",
              isInternalField: true,
              labelText: "Item Name",
            ),
            Divider(
              height: blockHeight,
              thickness: blockHeight / 2,
            ),
            CustomInputField(
              attribute: "value",
              isInternalField: true,
              labelText: "Item Value",
            ),
            Divider(
              height: blockHeight,
              thickness: blockHeight / 2,
            ),
            CustomInputField(
              attribute: "des",
              isInternalField: true,
              labelText: "Item Description",
            ),
            // Divider(
            //   height: blockHeight,
            //   thickness: blockHeight / 2,
            // ),
            // Container(
            //   height: blockHeight * 10,
            //   // color: Colors.greenAccent,
            //   alignment: Alignment.center,
            //   padding: EdgeInsets.symmetric(
            //     horizontal: blockWidth * 3,
            //   ),
            //   child: Container(
            //     height: blockHeight * 6,
            //     // color: Colors.green,
            //     alignment: Alignment.center,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Container(
            //           // width: blockWidth * 30,
            //           // color: Colors.red,
            //           alignment: Alignment.center,
            //           child: Container(
            //             height: blockHeight * 3,
            //             // color: Colors.yellow,
            //             alignment: Alignment.center,
            //             child: AutoSizeText(
            //               "Postage cost",
            //               style: TextStyle(
            //                 fontSize: 18,
            //                 color: Globals.mainColor,
            //               ),
            //               minFontSize: 14,
            //             ),
            //           ),
            //         ),
            //         Container(
            //           // width: blockWidth * 30,
            //           // color: Colors.red,
            //           alignment: Alignment.center,
            //           child: Container(
            //             height: blockHeight * 3,
            //             // color: Colors.yellow,
            //             alignment: Alignment.center,
            //             child: AutoSizeText(
            //               "CAD \$20.00",
            //               style: TextStyle(
            //                 fontSize: 18,
            //                 color: Globals.mainColor,
            //               ),
            //               minFontSize: 14,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: blockHeight * 2,
            // ),
          ],
        ),
      ),
    );
  }
}
