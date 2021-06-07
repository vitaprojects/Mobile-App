import 'package:flutter/material.dart';
import 'package:newpostman1/features/TotalEarnings/presentation/EarningSectionWidget.dart';
import 'package:newpostman1/features/TotalEarnings/presentation/EarningsInfoCard.dart';
import 'package:newpostman1/features/TotalEarnings/presentation/TotalEarningsAppBar.dart';
import 'package:newpostman1/features/TotalEarnings/presentation/TotalEarningsOverviewSelectionWidget.dart';
import 'package:newpostman1/features/TotalEarnings/presentation/pages/totalEarningsWidgetViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../useful/globals.dart';

class TotalEarningsWidget extends StatelessWidget {
  TotalEarningsWidget({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    double margin = blockWidth * 5;
    return SafeArea(
      child: Scaffold(
        body: ViewModelBuilder<TotalEarningsWidgetViewModel>.reactive(
            onModelReady: (model) {
              //model.listenToChangesInUserModel();
            },
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
                                  text: model.completedJobs,
                                ),
                                SizedBox(
                                  width: blockWidth * 2,
                                ),
                                EarningsInfoCard(
                                  cardType: 1,
                                  text: model.cancelledJobs,
                                ),
                                SizedBox(
                                  width: blockWidth * 2,
                                ),
                                EarningsInfoCard(
                                  cardType: 2,
                                  text: model.ongoingJobs,
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
                                  // EarningSectionWidget(
                                  //   earning: "\$${model.totalEarning}",
                                  //   title: "Total earnings",
                                  // ),
                                  Divider(
                                    height: blockHeight / 2,
                                    thickness: blockHeight / 4,
                                  ),
                                  // EarningSectionWidget(
                                  //   earning:
                                  //       "${model.getData != null ? model.getData.commpletedJobs ?? 0.0 : 0}",
                                  //   title: "Completed Jobs",
                                  // ),
                                  Divider(
                                    height: blockHeight / 2,
                                    thickness: blockHeight / 4,
                                  ),
                                  // EarningSectionWidget(
                                  //   earning:
                                  //       "${model.getData != null ? model.getData.ongoingJobs ?? 0.0 : 0}",
                                  //   title: "Active jobs",
                                  // ),
                                  Divider(
                                    height: blockHeight / 2,
                                    thickness: blockHeight / 4,
                                  ),
                                  // EarningSectionWidget(
                                  //   earning:
                                  //       "${model.getData != null ? model.getData.cancelledJobs ?? 0.0 : 0}",
                                  //   title: "Cancelled Jobs",
                                  // ),
                                  Divider(
                                    height: blockHeight / 2,
                                    thickness: blockHeight / 4,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                  TotalEarningsOverviewSelectionWidget(
                    onChanged: (value) {
                      //model.updateOverView(value);
                    },
                    indexValue: model.indexVal,
                  ), //add a value returning function here
                  TotalEarningsAppBar(),
                ],
              );
            },
            viewModelBuilder: () => TotalEarningsWidgetViewModel()),
      ),
    );
  }
}
