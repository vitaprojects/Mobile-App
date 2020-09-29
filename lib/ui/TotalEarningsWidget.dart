import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/TotalEarnings/EarningSectionWidget.dart';
import 'package:newpostman1/customWidgets/TotalEarnings/EarningsInfoCard.dart';
import 'package:newpostman1/customWidgets/TotalEarnings/TotalEarningsAppBar.dart';
import 'package:newpostman1/customWidgets/TotalEarnings/TotalEarningsOverviewSelectionWidget.dart';

import '../globals.dart';

class TotalEarningsWidget extends StatelessWidget {
  TotalEarningsWidget({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  double margin;

  @override
  Widget build(BuildContext context) {
    margin = blockWidth * 5;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: blockHeight * 100,
              width: blockWidth * 100,
              color: Colors.white,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    height: blockHeight * 30,
                    // color: Colors.yellow,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: margin,
                    ),
                    height: blockHeight * 16,
                    // color: Colors.blueAccent,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        EarningsInfoCard(
                          cardType: 0,
                        ),
                        SizedBox(
                          width: blockWidth * 2,
                        ),
                        EarningsInfoCard(
                          cardType: 1,
                        ),
                        SizedBox(
                          width: blockWidth * 2,
                        ),
                        EarningsInfoCard(
                          cardType: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: blockHeight * 3,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(
                      horizontal: margin,
                    ),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      10,
                    )),
                    child: Container(
                      // height: blockHeight * 20,
                      // color: Colors.greenAccent,

                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          EarningSectionWidget(
                            earning: "\$00.00",
                            title: "Total earnings",
                          ),
                          Divider(
                            height: blockHeight / 2,
                            thickness: blockHeight / 4,
                          ),
                          EarningSectionWidget(
                            earning: "\$00.00",
                            title: "Completed Jobs",
                          ),
                          Divider(
                            height: blockHeight / 2,
                            thickness: blockHeight / 4,
                          ),
                          EarningSectionWidget(
                            earning: "\$00.00",
                            title: "Active jobs",
                          ),
                          Divider(
                            height: blockHeight / 2,
                            thickness: blockHeight / 4,
                          ),
                          EarningSectionWidget(
                            earning: "\$00.00",
                            title: "Cancelled Jobs",
                          ),
                          Divider(
                            height: blockHeight / 2,
                            thickness: blockHeight / 4,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            TotalEarningsOverviewSelectionWidget(), //add a value returning function here
            TotalEarningsAppBar(),
          ],
        ),
      ),
    );
  }
}
