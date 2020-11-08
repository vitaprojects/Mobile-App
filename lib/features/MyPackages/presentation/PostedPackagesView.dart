import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/TripDetailsCard.dart';
import 'package:newpostman1/features/MyPackages/presentation/PostedPackagesViewModel.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

class PostedPackagesWidget extends ViewModelWidget<PostedPackagesViewModel> {
  PostedPackagesWidget({Key key}) : super(key: key);

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context, PostedPackagesViewModel model) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: blockHeight * 2,
          ),
          Expanded(
            child: StreamBuilder(
              stream: model.postedPackagesService.getAllPostedPackages(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  print("printing data");
                  // QuerySnapshot querySnapshot = snapshot.data;
                  print(snapshot.data?.length.toString() + "length of data");
                  // return Text("hiii");
                  List<FullPackageModel> packages = snapshot.data;
                  if (packages != null && packages.length != 0) {
                    return ListView.builder(
                      itemCount: packages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TripDetailsCard(
                          isPackage: true,
                          fullPackageModel: packages[index],
                          indexOftheCard: index + 1,
                          // itenaryModel: trips[index],
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: blockWidth * 5,
                        ),
                        height: blockHeight * 15,
                        // color: Colors.red,
                        alignment: Alignment.center,
                        child: Container(
                          height: blockHeight * 10,
                          // color: Colors.yellow,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            "You don't have any shipments",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                            minFontSize: 15,
                          ),
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
            ),
          ),

          // TripDetailsCard(
          //   isPackage: true,
          // ),
        ],
      ),
    );
  }
}
