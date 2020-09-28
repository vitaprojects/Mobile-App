import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';

class PackageListedMessage extends StatelessWidget {
  PackageListedMessage({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: blockHeight * 40,
                // color: Colors.red,
                margin: EdgeInsets.symmetric(
                  horizontal: blockWidth * 10,
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/posted.png",
                  height: blockHeight * 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.yellow,
                margin: EdgeInsets.symmetric(
                  horizontal: blockWidth * 5,
                ),
                height: blockHeight * 30,
                // color: Colors.orange,
                alignment: Alignment.center,
                child: Text(
                  "Your package has been successfully listed,\n Please review and confirm below and wait for a postman to accept your package for a delivery.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            RaisedButton(
              color: Globals.mainColor,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(
                        20,
                      ))),
              padding: EdgeInsets.all(
                0,
              ),
              onPressed: () {},
              child: Container(
                height: blockHeight * 10,
                // color: Colors.redAccent,
                alignment: Alignment.center,
                child: Container(
                  height: blockHeight * 5,
                  // color: Colors.yellow,
                  alignment: Alignment.center,
                  child: Container(
                      height: blockHeight * 3,
                      // color: Colors.green,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "Review",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            minFontSize: 14,
                          ),
                          SizedBox(
                            width: blockWidth * 5,
                          ),
                          Container(
                            width: blockWidth * 10,
                            // color: Colors.orange,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
