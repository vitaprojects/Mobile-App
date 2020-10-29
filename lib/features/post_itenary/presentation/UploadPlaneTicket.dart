import 'package:flutter/material.dart';

import '../../../useful/globals.dart';

class UploadPlaneTicketWidget extends StatefulWidget {
  UploadPlaneTicketWidget({Key key}) : super(key: key);

  @override
  _UploadPlaneTicketWidgetState createState() =>
      _UploadPlaneTicketWidgetState();
}

class _UploadPlaneTicketWidgetState extends State<UploadPlaneTicketWidget> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        20,
      )),
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      elevation: 20,
      child: Container(
        height: blockHeight * 15,
        // color: Colors.green,

        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: blockHeight * 5,
              // color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: blockWidth * 3,
              ),
              child: Text(
                "upload ticket".toUpperCase(),
                style: TextStyle(
                  fontSize:
                      15, //TODO check the font size of each formfiled title
                  color: Globals.mainColor,
                ),
              ),
            ),
            Container(
              height: blockHeight * 10,
              // color: Colors.green,
              alignment: Alignment.center,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  15,
                )),
                onPressed: () {},
                padding: EdgeInsets.all(
                  0,
                ),
                child: Container(
                  height: blockHeight * 6,
                  width: blockWidth * 30,
                  // color: Colors.red,
                  alignment: Alignment.center,
                  child: Container(
                    height: blockHeight * 5,
                    width: blockHeight * 5,
                    // color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.file_upload,
                      size: blockHeight * 5,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
