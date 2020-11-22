import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/find_postman_for_errand/presentation/AvailablePostmanForErrandViewModel.dart';
import 'package:newpostman1/features/find_postman_for_package/presentation/AvailablePostmanCard.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

class AvailablePostmanForErrandView extends StatelessWidget {
  AvailablePostmanForErrandView({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final margin = Globals.blockWidth * 5;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AvailablePostmanForErrandViewModel>.reactive(
        onModelReady: (model) {
          model.initialize();
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Globals.mainColor,
                title: Text("Available postman for errand"),
              ),
              body: Column(
                children: [
                  Container(
                    height: blockHeight * 2,
                    color: Colors.red,
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
                      child: model.postErrandModel != null
                          ? StreamBuilder(
                              stream: model.findAvailablePostmanService
                                  .getAvailablePostman(model.postErrandModel),
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
                              child: Container(
                                height: blockHeight * 10,
                                //  color: Colors.greenAccent,
                                margin: EdgeInsets.symmetric(
                                  horizontal: blockWidth * 10,
                                ),
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  "You haven't posted any errands",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  minFontSize: 18,
                                ),
                              ),
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
        viewModelBuilder: () => AvailablePostmanForErrandViewModel());
  }
}
