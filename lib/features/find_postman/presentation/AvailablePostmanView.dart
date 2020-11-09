import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/find_postman/domain/find_available_postman_service.dart';
import 'package:newpostman1/features/find_postman/presentation/AvailablePostmanCard.dart';
import 'package:newpostman1/features/find_postman/presentation/AvailablePostmanViewModel.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

class AvailablePostmanView extends StatelessWidget {
  AvailablePostmanView();
  final double blockHeight = Globals.blockHeight;
  final FindAvailablePostmanService findAvailablePostmanService =
      locator<FindAvailablePostmanService>();

  final double blockWidth = Globals.blockWidth;

  final double margin = Globals.blockWidth * 5;

  @override
  Widget build(BuildContext context) {
    // margin = blockWidth * 5;
    return ViewModelBuilder<AvailablePostmanViewModel>.reactive(
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Globals.mainColor,
                title: Text("Available Postmans"),
              ),
              body: Column(
                children: [
                  Container(
                    height: blockHeight * 2,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: blockHeight * 5,
                        left: margin,
                        right: margin,
                      ),
                      // color: Colors.yellow,
                      height: blockHeight * 15,
                      alignment: Alignment.center,
                      child: model.latestPackage != null
                          ? StreamBuilder(
                              stream: findAvailablePostmanService
                                  .getAvailablePostman(model.latestPackage),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.active) {
                                  List<ItenaryModel> list = snapshot.data;
                                  if (list != null && list.length != 0) {
                                    return Container(
                                      // color: Colors.yellow,
                                      // margin: EdgeInsets.symmetric(
                                      //   horizontal: margin,
                                      // ),
                                      alignment: Alignment.center,
                                      child: ListView.builder(
                                        itemCount: list.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return AvailablePostmanCard(
                                            itenaryModel: list[index],
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      height: blockHeight * 10,
                                      // color: Colors.redAccent,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Sorry we cannot find any matching postman",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    );
                                  }
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ),
                  // Expanded(
                  //   child: Container(
                  //     // color: Colors.yellow,
                  //     // margin: EdgeInsets.symmetric(
                  //     //   horizontal: margin,
                  //     // ),
                  //     alignment: Alignment.center,
                  //     child: ListView.builder(
                  //       itemCount: 1,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return AvailablePostmanCard();
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: blockHeight * 5,
                  )
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => AvailablePostmanViewModel());
  }
}
