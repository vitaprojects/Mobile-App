import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/features/home/presentation/home_view.dart';

import '../useful/globals.dart';

class RunErrandWidget extends StatefulWidget {
  RunErrandWidget({Key key}) : super(key: key);

  @override
  _RunErrandWidgetState createState() => _RunErrandWidgetState();
}

class _RunErrandWidgetState extends State<RunErrandWidget> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Card(
              color: Globals.mainColor,
              margin: EdgeInsets.symmetric(
                horizontal: blockWidth * 5,
              ),
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                10,
              )),
              child: Container(
                height: blockHeight * 15,
                // color: Colors.redAccent,
                alignment: Alignment.center,
                child: Container(
                  height: blockHeight * 5,
                  // color: Colors.yellow,
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    "Run Errand",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    minFontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              height: blockHeight * 15,
              // color: Colors.yellow,
            ),
            Card(
              margin: EdgeInsets.symmetric(
                horizontal: blockWidth * 5,
              ),
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                10,
              )),
              child: Container(
                  height: blockHeight * 20,
                  // color: Colors.greenAccent,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: blockHeight * 6,
                        // color: Colors.redAccent,
                        alignment: Alignment.center,
                        child: FormBuilderCheckbox(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 20,
                            ),
                            attribute: "pickup",
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            label: Text(
                              "Item picked up",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: blockHeight * 3,
                      ),
                      Container(
                        height: blockHeight * 6,
                        // color: Colors.redAccent,
                        alignment: Alignment.center,
                        child: FormBuilderCheckbox(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: blockWidth * 20,
                            ),
                            attribute: "pickup",
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            label: Text(
                              "Item delivered",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: blockHeight * 20,
            ),
            FormButton(
              buttonText: "Errand completed",
              ontapFun: () {
                Get.offAll(HomePage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
