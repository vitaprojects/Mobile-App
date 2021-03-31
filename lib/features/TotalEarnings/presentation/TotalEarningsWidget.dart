import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/features/TotalEarnings/data/total_earnings_service.dart';
import 'package:newpostman1/features/TotalEarnings/presentation/EarningSectionWidget.dart';
import 'package:newpostman1/features/TotalEarnings/presentation/EarningsInfoCard.dart';
import 'package:newpostman1/features/TotalEarnings/presentation/TotalEarningsAppBar.dart';
import 'package:newpostman1/features/TotalEarnings/presentation/TotalEarningsOverviewSelectionWidget.dart';
import 'package:newpostman1/features/TotalEarnings/presentation/totalEarningsWidgetViewModel.dart';
import 'package:newpostman1/features/withdraw/presentation/pages/withdarwView.dart';

import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

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
        body: ViewModelBuilder<TotalEarningsWidgetViewModel>.reactive(
            builder: (context, model, widget) {
              return Stack(
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
                                  text: model.getData != null
                                      ? model.getData.commpletedJobs
                                      : 0,
                                ),
                                SizedBox(
                                  width: blockWidth * 2,
                                ),
                                EarningsInfoCard(
                                  cardType: 1,
                                  text: model.getData != null
                                      ? model.getData.cancelledJobs
                                      : 0,
                                ),
                                SizedBox(
                                  width: blockWidth * 2,
                                ),
                                EarningsInfoCard(
                                  cardType: 2,
                                  text: model.getData != null
                                      ? model.getData.pendingJobs ?? 0
                                      : 0,
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
                                    earning:
                                        "\$${model.getData != null ? model.getData.totalEarnings ?? 0.0 : 0}",
                                    title: "Total earnings",
                                  ),
                                  Divider(
                                    height: blockHeight / 2,
                                    thickness: blockHeight / 4,
                                  ),
                                  EarningSectionWidget(
                                    earning:
                                        "${model.getData != null ? model.getData.commpletedJobs ?? 0.0 : 0}",
                                    title: "Completed Jobs",
                                  ),
                                  Divider(
                                    height: blockHeight / 2,
                                    thickness: blockHeight / 4,
                                  ),
                                  EarningSectionWidget(
                                    earning:
                                        "${model.getData != null ? model.getData.ongoingJobs ?? 0.0 : 0}",
                                    title: "Active jobs",
                                  ),
                                  Divider(
                                    height: blockHeight / 2,
                                    thickness: blockHeight / 4,
                                  ),
                                  EarningSectionWidget(
                                    earning:
                                        "${model.getData != null ? model.getData.cancelledJobs ?? 0.0 : 0}",
                                    title: "Cancelled Jobs",
                                  ),
                                  Divider(
                                    height: blockHeight / 2,
                                    thickness: blockHeight / 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: blockHeight * 15 / 3,
                          ),
                          FormButton(
                            buttonText: 'Withdraw',
                            ontapFun: () {
                              Get.to(WithdrawView());
                            },
                          ),
                        ],
                      )),
                  TotalEarningsOverviewSelectionWidget(
                    onChanged: (value) {
                      model.updateOverView(value);
                    },
                    indexValue: model.indexVal,
                  ), //add a value returning function here
                  TotalEarningsAppBar(
                    text: model.getData != null
                        ? model.getData.totalEarnings.toString()
                        : 0.toString() ?? 0.toString().toString(),
                  ),
                ],
              );
            },
            viewModelBuilder: () => TotalEarningsWidgetViewModel()),
      ),
    );
  }
}
