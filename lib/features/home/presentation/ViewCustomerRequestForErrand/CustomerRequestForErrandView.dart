import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/home/presentation/ViewCustomerRequestForPackage/PackageRequestListTile.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

import 'CustomerRequestForErrandViewModel.dart';

class CustomerRequestForErrandView extends StatelessWidget {
  CustomerRequestForErrandView({@required this.requestModel});
  final RequestModel requestModel;
  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    double margin = blockWidth * 5;

    return ViewModelBuilder<CustomerRequestForErrandViewModel>.reactive(
      onModelReady: (model) {
        model.initialiseData(requestModel);
      },
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: margin,
                  ),
                  height: blockHeight * 10,
                  // color: Colors.red,
                  alignment: Alignment.center,
                  child: Container(
                    height: blockHeight * 5,
                    // color: Colors.greenAccent,
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "You received a new request",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      ),
                      minFontSize: 18,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      // color: Colors.grey,
                      height: blockHeight * 5,
                    ),
                    PackageRequestListTile(
                        labelText: "Customer", value: "Kariya"),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    PackageRequestListTile(
                        labelText: "Pickup from", value: "Kariya"),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    PackageRequestListTile(
                        labelText: "Pickup type", value: "Kariya"),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    PackageRequestListTile(
                        labelText: "Phone number", value: "Kariya"),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                    // Card(
                    //   margin: EdgeInsets.symmetric(
                    //     horizontal: margin,
                    //   ),
                    //   elevation: 10,
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(
                    //     10,
                    //   )),
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(
                    //       horizontal: blockWidth * 2,
                    //       vertical: blockHeight,
                    //     ),
                    //     height: blockHeight * 25,
                    //     // color: Colors.greenAccent,
                    //     alignment: Alignment.centerLeft,
                    //     child: Container(
                    //       height: blockHeight * 23,
                    //       // color: Colors.yellow,
                    //       alignment: Alignment.centerLeft,
                    //       child: Swiper(
                    //         pagination: SwiperPagination(
                    //           alignment: Alignment.bottomCenter,
                    //           builder: DotSwiperPaginationBuilder(
                    //             color: Colors.grey,
                    //             activeColor: Globals.mainColor,
                    //           ),
                    //         ),
                    //         itemCount:
                    //             model.packageModel?.images?.length != null
                    //                 ? model.packageModel.images.length
                    //                 : 0,
                    //         itemBuilder: (context, index) {
                    //           return CachedNetworkImage(
                    //             imageUrl: model.packageModel.images[index],
                    //             placeholder: (context, url) {
                    //               return Center(
                    //                 child: CircularProgressIndicator(),
                    //               );
                    //             },
                    //             height: blockHeight * 23,
                    //           );
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: blockHeight * 2,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => CustomerRequestForErrandViewModel(),
    );
  }
}
