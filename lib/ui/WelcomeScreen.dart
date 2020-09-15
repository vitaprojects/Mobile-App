import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/globals.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Globals.blockHeight);
    print(Globals.blockWidth);
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;
    if (Globals.blockHeight != null && Globals.blockWidth != null) {
      return SafeArea(
          child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: blockHeight * 100,
              width: blockWidth * 100,
              color: Colors.orange,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: blockHeight * 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20,
                    ),
                    topRight: Radius.circular(
                      20,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Container(
                  height: blockHeight * 6,
                  // color: Colors.blue,
                  margin: EdgeInsets.symmetric(
                    horizontal: blockWidth * 5,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlineButton(
                          highlightedBorderColor: Colors.green,
                          borderSide: BorderSide(
                              color: Colors.white, width: blockWidth / 2),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          padding: EdgeInsets.all(
                            0,
                          ),
                          onPressed: () {},
                          child: Container(
                            // color: Colors.yellow,
                            alignment: Alignment.center,
                            child: Container(
                              height: blockHeight * 3,
                              // color: Colors.amberAccent,
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                "Log in".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white,
                                ),
                                minFontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: blockWidth * 6,
                      ),
                      Expanded(
                        child: OutlineButton(
                          highlightedBorderColor: Colors.green,
                          borderSide: BorderSide(
                              color: Colors.white, width: blockWidth / 2),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          padding: EdgeInsets.all(
                            0,
                          ),
                          onPressed: () {},
                          child: Container(
                            // color: Colors.yellow,
                            alignment: Alignment.center,
                            child: Container(
                              height: blockHeight * 3,
                              // color: Colors.amberAccent,
                              alignment: Alignment.center,
                              child: AutoSizeText(
                                "sign up".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white,
                                ),
                                minFontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ));
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
