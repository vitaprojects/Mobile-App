import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/ongoing-orders/presentation/pages/ongoing_orders_view_model.dart';
import 'package:newpostman1/features/ongoing-orders/presentation/widgets/ongoing_order_card_widget.dart';
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
                                    return OngoingOrderCardWidget(
                                      orderModel: model.data[index],
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
