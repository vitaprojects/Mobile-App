import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';

class UploadedImagesOfPackage extends StatelessWidget {
  UploadedImagesOfPackage({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

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
        height: blockHeight * 21,
        // color: Colors.red,

        padding: EdgeInsets.symmetric(
          horizontal: blockHeight,
        ),
        alignment: Alignment.center,
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
                  "Photos",
                  style: TextStyle(
                    fontSize: 16,
                    color: Globals.mainColor,
                  ),
                  minFontSize: 12,
                ),
              ),
            ),
            Container(
              height: blockHeight * 15,
              // color: Colors.yellow,
              alignment: Alignment.center,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: blockHeight * 12,
                    color: Colors.grey.shade300,
                    margin: EdgeInsets.only(
                      right: blockWidth * 2,
                    ),
                    width: blockWidth * 25,
                  );
                },
              ),
            ),
            SizedBox(
              height: blockHeight,
            ),
          ],
        ),
      ),
    );
  }
}
