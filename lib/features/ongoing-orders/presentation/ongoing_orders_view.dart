import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/ongoing-orders/presentation/ongoing_orders_view_model.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

class OngoingOrdersView extends StatelessWidget {
  OngoingOrdersView({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;

  final double margin = Globals.blockWidth * 5;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OngoingOrdersViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Globals.mainColor,
                title: Text("Ongoing Orders"),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: blockHeight * 2,
                    ),
                    model.dataReady
                        ? Builder(
                            builder: (context) {
                              if (model.data.isEmpty) {
                                return Center(
                                  child: Container(
                                    height: blockHeight * 10,
                                    // color: Colors.greenAccent,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: blockWidth * 10,
                                    ),
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      "You don't have any ongoing orders",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      minFontSize: 18,
                                    ),
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                  controller: ScrollController(),
                                  shrinkWrap: true,
                                  itemCount: model.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 10,
                                      margin: EdgeInsets.only(
                                        bottom: blockHeight * 2,
                                        left: blockWidth * 5,
                                        right: blockWidth * 5,
                                      ),
                                      child: Container(
                                        height: blockHeight * 15,
                                        // color: Colors.red,

                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                // color: Colors.yellow,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Order ID : ${model.data[index].orderID}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                // color: Colors.green,
                                                alignment: Alignment.center,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: blockWidth * 5,
                                                    ),
                                                    Text(
                                                        "Tip : ${model.data[index].tipAmount}"),
                                                    SizedBox(
                                                      width: blockWidth * 10,
                                                    ),
                                                    Text(
                                                        "Your Fee : ${model.data[index].postmanFee}"),
                                                    Expanded(
                                                        child: Container(
                                                      // color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(model
                                                                  .data[index]
                                                                  .type ==
                                                              1
                                                          ? "Package"
                                                          : "Errand"),
                                                    ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => OngoingOrdersViewModel());
  }
}
