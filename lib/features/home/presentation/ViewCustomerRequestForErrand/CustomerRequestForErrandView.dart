import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/home/presentation/ViewCustomerRequestForPackage/PackageRequestListTile.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

import '../CustomButtonToShowLocation.dart';
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
            body: SingleChildScrollView(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (model.showErrorMessage == true) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: blockWidth * 5,
                      ),
                      height: blockHeight * 100,
                      alignment: Alignment.center,
                      child: Text(
                        "Error occured while loading order data , please try again",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  } else {
                    return Column(
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
                              labelText: "Customer",
                              value: model.postErrandModel?.userEmaill,
                            ),
                            SizedBox(
                              height: blockHeight * 2,
                            ),
                            PackageRequestListTile(
                                labelText: "Pickup from",
                                value: model.postErrandModel?.pickUpFrom),
                            SizedBox(
                              height: blockHeight * 2,
                            ),
                            PackageRequestListTile(
                              labelText: "Pickup type",
                              value: model.postErrandModel?.pickUpType,
                            ),
                            SizedBox(
                              height: blockHeight * 2,
                            ),
                            PackageRequestListTile(
                              labelText: "Phone number",
                              value: (model.postErrandModel?.phone) ?? "",
                            ),
                            SizedBox(
                              height: blockHeight * 2,
                            ),
                            Card(
                              margin: EdgeInsets.symmetric(
                                horizontal: margin,
                              ),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                10,
                              )),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: blockWidth * 2,
                                  vertical: blockHeight,
                                ),
                                height: blockHeight * 25,
                                // color: Colors.greenAccent,
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: blockHeight * 23,
                                  // color: Colors.yellow,
                                  alignment: Alignment.centerLeft,
                                  child: Swiper(
                                    pagination: SwiperPagination(
                                      alignment: Alignment.bottomCenter,
                                      builder: DotSwiperPaginationBuilder(
                                        color: Colors.grey,
                                        activeColor: Globals.mainColor,
                                      ),
                                    ),
                                    itemCount: model.postErrandModel?.images
                                                ?.length !=
                                            null
                                        ? model.postErrandModel.images.length
                                        : 0,
                                    itemBuilder: (context, index) {
                                      return CachedNetworkImage(
                                        imageUrl:
                                            model.postErrandModel.images[index],
                                        placeholder: (context, url) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                        height: blockHeight * 23,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: blockHeight * 2,
                            ),
                            PackageRequestListTile(
                                labelText: "Pickup Location",
                                value:
                                    model.postErrandModel?.pAddress?.address),
                            CustomButtonToShowLocation(
                                callback: () {
                                  model.showLocationOnMaps(0);
                                },
                                buttonText: "show pickup location on map"),
                            PackageRequestListTile(
                                labelText: "Drop off Location",
                                value:
                                    model.postErrandModel?.dAddress?.address),
                            CustomButtonToShowLocation(
                                callback: () {
                                  model.showLocationOnMaps(1);
                                },
                                buttonText: "show destination location on map"),
                            PackageRequestListTile(
                              labelText: "Instructions",
                              value:
                                  (model.postErrandModel?.instructions) ?? "",
                            ),
                            SizedBox(
                              height: blockHeight * 2,
                            ),
                            PackageRequestListTile(
                              labelText: "Order No",
                              value: (model.postErrandModel?.orderNo) ?? "",
                            ),
                            SizedBox(
                              height: blockHeight * 2,
                            ),
                            PackageRequestListTile(
                              labelText: "Payment",
                              value:
                                  (model.postErrandModel?.payment.toString()) ??
                                      "",
                            ),
                            SizedBox(
                              height: blockHeight * 2,
                            ),
                            PackageRequestListTile(
                              labelText: "Order Tip",
                              value:
                                  (model.postErrandModel?.tip.toString()) ?? "",
                            ),
                            SizedBox(
                              height: blockHeight * 2,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            FormButton(
                              buttonText: "accept offer",
                              ontapFun: () {
                                /* Get.back();
                                        Future.delayed(Duration(seconds: 2))
                                            .then((value) {
                                          // Get.back();
                                          Get.snackbar("Offer sent",
                                              "Your offer sent successfully");
                                        }); */
                                print("send offer to the customer");
                                model.sendOffer();
                              },
                            ),
                            SizedBox(
                              height: blockHeight * 10,
                            ),
                          ],
                        )
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => CustomerRequestForErrandViewModel(),
    );
  }
}
