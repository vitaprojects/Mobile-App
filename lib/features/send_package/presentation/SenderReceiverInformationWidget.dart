import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../useful/globals.dart';
import 'SenderInformationCard.dart';

class SenderReceiverInformationWidget extends StatelessWidget {
  SenderReceiverInformationWidget({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      margin: EdgeInsets.symmetric(horizontal: blockWidth * 5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      child: Container(
        // height: blockHeight * 20,
        // color: Colors.red,
        padding: EdgeInsets.all(blockHeight),
        child: Column(
          children: [
            Container(
              height: blockHeight * 5,
              // color: Colors.green,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 2.5,
                // color: Colors.yellow,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  "Sender / Receiver Information",
                  style: TextStyle(
                    fontSize: 16,
                    color: Globals.mainColor,
                    fontWeight: FontWeight.w600,
                  ),
                  minFontSize: 14,
                ),
              ),
            ),
            SenderInformationCard(
              isSender: true,
            ),
            Divider(
              height: blockHeight,
              thickness: blockHeight / 2,
            ),
            SenderInformationCard()
          ],
        ),
      ),
    );
  }
}
