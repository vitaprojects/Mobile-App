import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/customWidgets/AboutUsInfoCard.dart';

import '../useful/globals.dart';

class AboutUSPage extends StatelessWidget {
  AboutUSPage({Key key}) : super(key: key);

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: blockHeight * 20,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    height: blockHeight * 20,
                    // color: Colors.orange,
                  ),
                  Container(
                    height: blockHeight * 10,
                    color: Globals.mainColor,
                    alignment: Alignment.center,
                    child: Container(
                      height: blockHeight * 4,
                      // color: Colors.redAccent,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "About US",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        minFontSize: 18,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: blockHeight * 3,
                      ),
                      height: blockHeight * 10,
                      // color: Colors.redAccent,
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Globals.mainColor,
                        radius: blockHeight * 5,
                        backgroundImage: AssetImage(
                          "assets/images/logoT.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: blockHeight * 10,
            ),
            AboutUsInfoCard(
              icon: Icon(FontAwesomeIcons.locationArrow),
              title: "Canada",
            ),
            SizedBox(
              height: blockHeight,
            ),
            AboutUsInfoCard(
              icon: Icon(
                Icons.web,
              ),
              title: "www.newpostman.com",
            ),
            SizedBox(
              height: blockHeight,
            ),
            AboutUsInfoCard(
              icon: Icon(FontAwesomeIcons.mailBulk),
              title: "contact@newpostman.com",
            ),
            SizedBox(
              height: blockHeight,
            ),
            AboutUsInfoCard(
              icon: Icon(FontAwesomeIcons.info),
              title: "Terms of service",
            ),
            SizedBox(
              height: blockHeight,
            ),
            AboutUsInfoCard(
              icon: Icon(
                Icons.assignment,
              ),
              title: "Privacy Policy",
            ),
            SizedBox(
              height: blockHeight,
            ),
            AboutUsInfoCard(
              icon: Icon(
                FontAwesomeIcons.question,
              ),
              title: "FAQ",
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
