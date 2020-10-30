import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({@required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Globals.mainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: blockHeight * 60,
                // color: Colors.yellow,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: blockHeight * 15,
                        bottom: blockHeight * 5,
                      ),
                      height: blockHeight * 15,
                      // color: Colors.redAccent,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        ),
                        minFontSize: 14,
                      ),
                    ),
                    SpinKitChasingDots(
                      color: Colors.white,
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                height: blockHeight * 20,
                // width: ,
                // color: Colors.redAccent,
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: blockHeight * 5,
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/images/logoT.png",
                    height: blockHeight * 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
