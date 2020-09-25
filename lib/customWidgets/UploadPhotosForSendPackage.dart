import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class UploadPhotosForSendPackage extends StatefulWidget {
  UploadPhotosForSendPackage({Key key}) : super(key: key);

  @override
  _UploadPhotosForSendPackageState createState() =>
      _UploadPhotosForSendPackageState();
}

class _UploadPhotosForSendPackageState
    extends State<UploadPhotosForSendPackage> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

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
        height: blockHeight * 23,
        // color: Colors.red,
        margin: EdgeInsets.all(
          blockHeight,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: blockHeight * 5,
              // color: Colors.green,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight *
                    2.5, //TODO the height of a title in this for is 2.5*blockHeight
                // color: Colors.orange,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  "upload photos of the package".toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Globals.mainColor,
                  ),
                  minFontSize: 12,
                ),
              ),
            ),
            Container(
              height: blockHeight * 10,
              // color: Colors.greenAccent,
              alignment: Alignment.center,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: blockHeight * 10,
                    color: Colors.yellow,
                    width: blockHeight * 8,
                    margin: EdgeInsets.only(
                      right: blockWidth,
                    ),
                  );
                },
              ),
            ),
            Container(
              height: blockHeight * 8,
              // color: Colors.yellow,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 5,
                // color: Colors.redAccent,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        10,
                      )),
                      color: Globals.mainColor,
                      onPressed: () {},
                      padding: EdgeInsets.all(
                        0,
                      ),
                      child: Container(
                        width: blockWidth * 40,
                        // color: Colors.yellowAccent,
                        alignment: Alignment.center,
                        child: Container(
                          height: blockHeight * 2.5,
                          // color: Colors.yellow,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            "Take photo",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            minFontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        10,
                      )),
                      color: Globals.mainColor,
                      onPressed: () {},
                      padding: EdgeInsets.all(
                        0,
                      ),
                      child: Container(
                        width: blockWidth * 40,
                        // color: Colors.yellowAccent,
                        alignment: Alignment.center,
                        child: Container(
                          height: blockHeight * 2.5,
                          // color: Colors.yellow,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            "Choose from gallery",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            minFontSize: 12,
                          ),
                        ),
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
