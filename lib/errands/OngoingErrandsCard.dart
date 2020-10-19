import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/errands/OngoingErrandFullPage.dart';

import '../globals.dart';

class OngoingErrandsCard extends StatelessWidget {
  OngoingErrandsCard({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(OngoingErrandsFullPage());
      },
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          15,
        )),
        margin: EdgeInsets.only(
          bottom: blockHeight,
          left: blockWidth * 5,
          right: blockWidth * 5,
        ),
        child: Container(
            padding: EdgeInsets.all(
              blockHeight,
            ),
            height: blockHeight * 15,
            // color: Colors.redAccent,
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  width: blockHeight * 13,
                  // color: Colors.orange,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/errandicon.png",
                  ),
                ),
                SizedBox(
                  width: blockWidth * 2,
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: blockWidth * 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        height: blockHeight * 3,
                        // color: Colors.orange,
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          "Errand ID:12345679",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          minFontSize: 12,
                        ),
                      ),
                      Container(
                        height: blockHeight * 5,
                        // color: Colors.yellow,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "PickUp : USA , NY",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Container(
                        height: blockHeight * 5,
                        // color: Colors.yellow,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Drop Off : USA , NY",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            )),
      ),
    );
  }
}
