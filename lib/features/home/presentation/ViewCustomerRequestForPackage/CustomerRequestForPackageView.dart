import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/features/find_postman/data/RequestModel.dart';
import 'package:newpostman1/features/home/presentation/CustomButtonToShowLocation.dart';
import 'package:newpostman1/features/home/presentation/ViewCustomerRequestForPackage/CustomerRequestForPackageViewModel.dart';
import 'package:newpostman1/features/home/presentation/ViewCustomerRequestForPackage/PackageRequestListTile.dart';
import 'package:stacked/stacked.dart';
import '../../../../useful/globals.dart';

//this widget will display the cucstomer request for the postman
class CustomerRequestForPackageView extends StatelessWidget {
  CustomerRequestForPackageView({this.requestModel});
  final RequestModel requestModel;

  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    double margin = blockWidth * 5;
    return ViewModelBuilder<CustomerRequestForPackageViewModel>.reactive(
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
                          (model.packageModel != null)
                              ? Column(
                                  children: [
                                    Container(
                                      // color: Colors.grey,
                                      height: blockHeight * 5,
                                    ),
                                    PackageRequestListTile(
                                      labelText: "Customer ",
                                      value: model.packageModel?.sDetails?.name,
                                    ),
                                    SizedBox(
                                      height: blockHeight * 2,
                                    ),
                                    PackageRequestListTile(
                                        labelText: "Item description",
                                        value: model.packageModel?.description),
                                    SizedBox(
                                      height: blockHeight * 2,
                                    ),
                                    LayoutBuilder(
                                      builder: (BuildContext context,
                                          BoxConstraints constraints) {
                                        if (model.packageModel.isStandard ==
                                            true) {
                                          return PackageRequestListTile(
                                              labelText: "Item Weight",
                                              value: "Standard");
                                        } else {
                                          return PackageRequestListTile(
                                              labelText: "Item Weight",
                                              value: model
                                                  .packageModel?.preciseWeight
                                                  ?.toString());
                                        }
                                      },
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
                                              builder:
                                                  DotSwiperPaginationBuilder(
                                                color: Colors.grey,
                                                activeColor: Globals.mainColor,
                                              ),
                                            ),
                                            itemCount: model.packageModel
                                                        ?.images?.length !=
                                                    null
                                                ? model
                                                    .packageModel.images.length
                                                : 0,
                                            itemBuilder: (context, index) {
                                              return CachedNetworkImage(
                                                imageUrl: model
                                                    .packageModel.images[index],
                                                placeholder: (context, url) {
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(),
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
                                        labelText: "Length , Height , Width",
                                        value: model.packageModel?.length
                                                .toString() +
                                            " , " +
                                            model.packageModel?.height
                                                .toString() +
                                            " , " +
                                            model.packageModel?.width
                                                .toString()),
                                    SizedBox(
                                      height: blockHeight * 2,
                                    ),
                                    PackageRequestListTile(
                                        labelText: "Pickup Location",
                                        value: model
                                            .packageModel?.dLocation?.address),
                                    CustomButtonToShowLocation(
                                        callback: () {
                                          model.showLocationOnMaps(0);
                                        },
                                        buttonText:
                                            "show pickup location on map"),
                                    PackageRequestListTile(
                                        labelText: "Drop off Location",
                                        value: model
                                            .packageModel?.fLocation?.address),
                                    CustomButtonToShowLocation(
                                        callback: () {
                                          model.showLocationOnMaps(1);
                                        },
                                        buttonText:
                                            "show destination location on map"),
                                    SizedBox(
                                      height: blockHeight * 2,
                                    ),
                                    Container(
                                      height: blockHeight * 10,
                                      // color: Colors.redAccent,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: margin,
                                      ),
                                      padding: EdgeInsets.all(
                                        blockHeight,
                                      ),
                                      alignment: Alignment.center,
                                      child: FormBuilderTextField(
                                        keyboardType: TextInputType.number,
                                        controller:
                                            model.offerTsextEditingController,
                                        attribute: "offer",
                                        decoration: InputDecoration(
                                            labelText: "Offer amount",
                                            labelStyle: TextStyle(
                                              color: Globals.mainColor,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    FormButton(
                                      buttonText: "Send offer",
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
                              : Container(
                                  height: blockHeight * 100,
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(),
                                ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => CustomerRequestForPackageViewModel());
  }
}
