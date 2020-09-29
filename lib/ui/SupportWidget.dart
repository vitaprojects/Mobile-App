import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';

import '../globals.dart';

class SupportWidget extends StatefulWidget {
  SupportWidget({Key key}) : super(key: key);

  @override
  _SupportWidgetState createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(
                0,
              ),
              color: Globals.mainColor,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  10,
                ),
                bottomRight: Radius.circular(
                  10,
                ),
              )),
              child: Container(
                height: blockHeight * 10,
                alignment: Alignment.center,
                child: Container(
                  height: blockHeight * 4,
                  // color: Colors.grey,
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    "Support",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    minFontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: blockHeight * 5,
            ),
            Container(
              height: blockHeight * 5,
              // color: Colors.yellow,
              margin: EdgeInsets.symmetric(
                horizontal: blockWidth * 5,
              ),
              alignment: Alignment.center,
              child: Text(
                "Get in touch !",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: blockHeight * 2,
            ),
            Container(
              height: blockHeight * 3,
              // color: Colors.yellow,
              margin: EdgeInsets.symmetric(
                horizontal: blockWidth * 5,
              ),
              alignment: Alignment.center,
              child: Text(
                "Feel free to contact us ",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: blockHeight * 2,
            ),
            Container(
              height: blockHeight * 3,
              // color: Colors.yellow,
              margin: EdgeInsets.symmetric(
                horizontal: blockWidth * 5,
              ),
              alignment: Alignment.center,
              child: Text(
                "support@newpostman.com",
                style: TextStyle(
                  fontSize: 16,
                  color: Globals.mainColor,
                ),
              ),
            ),
            SizedBox(
              height: blockHeight * 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: blockWidth * 5,
              ),
              child: CustomInputField(
                attribute: "contact",
                isDescription: true,
                labelText: "Type your message here",
              ),
            ),
            SizedBox(
              height: blockHeight * 5,
            ),
            FormButton(
              buttonText: "submit",
              ontapFun: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
