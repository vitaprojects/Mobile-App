import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../useful/globals.dart';

class TripDetailRowCard extends StatelessWidget {
  const TripDetailRowCard(
      {this.isDeparture, this.address, this.date, this.isErrand});
  final bool isDeparture;
  final String date;
  final String address;
  final bool
      isErrand; //if this is a errand the departure and arrival should be renamed to pickup and dropoff

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (isErrand == true) {
          return Container(
            // height: blockHeight * 10,
            // color: Colors.yellow,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  width: blockWidth * 15,
                  // color: Colors.redAccent,
                  alignment: Alignment.center,
                  child: Container(
                    height: blockHeight * 3,
                    width: blockHeight * 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (isDeparture == true) ? Colors.green : Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  width: blockWidth * 5,
                ),
                Expanded(
                    child: Container(
                  // color: Colors.greenAccent,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        height: blockHeight * 3,
                        // color: Colors.yellowAccent,
                        alignment: Alignment.centerLeft,
                        child: (isDeparture == true)
                            ? AutoSizeText(
                                "Pickup",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                minFontSize: 14,
                              )
                            : AutoSizeText(
                                "Drop Off",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                minFontSize: 14,
                              ),
                      ),
                      // Container(
                      //   height: blockHeight * 2,
                      //   // color: Colors.redAccent,
                      //   alignment: Alignment.centerLeft,
                      //   child: AutoSizeText(
                      //     date,
                      //     style: TextStyle(color: Colors.grey),
                      //   ),
                      // ),
                      Container(
                        // height: blockHeight * 5,
                        // color: Colors.green,
                        alignment: Alignment.topLeft,
                        child: Text(
                          (address) != null ? address : "",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          );
        } else {
          return Container(
            // height: blockHeight * 10,
            // color: Colors.yellow,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  width: blockWidth * 15,
                  // color: Colors.redAccent,
                  alignment: Alignment.center,
                  child: Container(
                    height: blockHeight * 3,
                    width: blockHeight * 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (isDeparture == true) ? Colors.green : Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  width: blockWidth * 5,
                ),
                Expanded(
                    child: Container(
                  // color: Colors.greenAccent,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        height: blockHeight * 3,
                        // color: Colors.yellowAccent,
                        alignment: Alignment.centerLeft,
                        child: (isDeparture == true)
                            ? AutoSizeText(
                                "Departure",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                minFontSize: 14,
                              )
                            : AutoSizeText(
                                "Arrival",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                minFontSize: 14,
                              ),
                      ),
                      Container(
                        height: blockHeight * 2,
                        // color: Colors.redAccent,
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          date,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                        // height: blockHeight * 5,
                        // color: Colors.green,
                        alignment: Alignment.topLeft,
                        child: Text(
                          (address) != null ? address : "",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          );
        }
      },
    );
  }
}
