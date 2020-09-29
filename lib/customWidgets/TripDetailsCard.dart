import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/ui/TripDetailRowCard.dart';

import '../globals.dart';

class TripDetailsCard extends StatelessWidget {
  const TripDetailsCard({
    this.isPackage,
  });
  final bool isPackage;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
        vertical: blockHeight * 2,
      ),
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        15,
      )),
      child: Container(
        margin: EdgeInsets.all(
          blockHeight * 2,
        ),
        // height: blockHeight * 20,
        // color: Colors.yellow,

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
                  "Posted on 04 Sep 2020",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  minFontSize: 14,
                ),
              ),
            ),
            Container(
              height: blockHeight * 6,
              // color: Colors.redAccent,
              alignment: Alignment.centerLeft,
              child: Container(
                height: blockHeight * 4.5,
                // color: Colors.yellow,
                alignment: Alignment.centerLeft,
                child: (isPackage == true)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: blockWidth * 15,
                            // color: Colors.green,
                            alignment: Alignment.center,
                            child: Container(
                              width: blockWidth * 10,
                              // color: Colors.yellow,
                              alignment: Alignment.center,
                              child: Text(
                                "74",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // width: blockWidth * 40,
                            // color: Colors.green,
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Postage cost : CAD\$20",
                              style: TextStyle(
                                color: Globals.mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.bus,
                          ),
                          SizedBox(
                            width: blockWidth * 3,
                          ),
                          Text(
                            "Bus".toUpperCase(),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
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
          ],
        ),
      ),
    );
  }
}
