import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../useful/globals.dart';

class WelcomeMessageCard extends StatelessWidget {
  const WelcomeMessageCard({
    this.title1,
    this.title2,
  });
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Card(
      margin: EdgeInsets.all(
        0,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(
          40,
        ),
        bottomRight: Radius.circular(
          40,
        ),
      )),
      child: Container(
        height: blockHeight * 30,
        // color: Colors.green,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: blockHeight * 15,
              width: blockHeight * 15,
              margin: EdgeInsets.only(
                bottom: blockHeight * 2,
              ),
              padding: EdgeInsets.all(
                blockHeight * 2,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Container(
                // color: Colors.red,
                // height: blockHeight * 12,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    90,
                  ),
                  child: Image.asset(
                    "assets/images/logoT.png",
                    color: Globals.mainColor,
                  ),
                ),
              ),
            ),
            Container(
              height: blockHeight * 4,
              // color: Colors.yellow,
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                bottom: blockHeight * 1,
              ),
              child: AutoSizeText(
                title1.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                minFontSize: 16,
              ),
            ),
            Container(
              height: blockHeight * 2.5,
              // color: Colors.yellow,
              alignment: Alignment.center,
              child: AutoSizeText(
                title2,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                minFontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
