import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';

import '../useful/globals.dart';

class ViewCustomerRequest extends StatelessWidget {
  ViewCustomerRequest();
  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    double margin = blockWidth * 5;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
              Container(
                // color: Colors.grey,
                height: blockHeight * 5,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  10,
                )),
                margin: EdgeInsets.symmetric(
                  horizontal: margin,
                ),
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: blockWidth * 2,
                    vertical: blockHeight,
                  ),
                  height: blockHeight * 6,
                  // color: Colors.greenAccent,

                  alignment: Alignment.centerLeft,
                  child: SizedBox.expand(
                    child: Container(
                      // color: Colors.yellow,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Customer : Vitalis",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
              Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(
                  horizontal: margin,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  10,
                )),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: blockWidth * 2,
                    vertical: blockHeight,
                  ),
                  // height: blockHeight * 6,
                  // color: Colors.greenAccent,

                  alignment: Alignment.centerLeft,
                  child: Container(
                    // color: Colors.yellow,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Item Description   : A product description is the marketing copy that explains what a product is and why it's worth purchasing. The purpose of a product description is to supply customers with important information about the features and benefits of the product so they're compelled to buy",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
              Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(
                  horizontal: margin,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  10,
                )),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: blockWidth * 2,
                    vertical: blockHeight,
                  ),
                  // height: blockHeight * 6,
                  // color: Colors.greenAccent,

                  alignment: Alignment.centerLeft,
                  child: Container(
                    // color: Colors.yellow,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Item Weight:0.5kg",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
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
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.network(
                          "https://hbr.org/resources/images/article_assets/2019/11/Nov19_14_sb10067951dd-001.jpg",
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
              Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(
                  horizontal: margin,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  10,
                )),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: blockWidth * 2,
                    vertical: blockHeight,
                  ),
                  // height: blockHeight * 6,
                  // color: Colors.greenAccent,

                  alignment: Alignment.centerLeft,
                  child: Container(
                    // color: Colors.yellow,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Pickup location",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: blockHeight * 2,
              ),
              Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(
                  horizontal: margin,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  10,
                )),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: blockWidth * 2,
                    vertical: blockHeight,
                  ),
                  // height: blockHeight * 6,
                  // color: Colors.greenAccent,

                  alignment: Alignment.centerLeft,
                  child: Container(
                    // color: Colors.yellow,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Drop off location",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
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
                  Get.back();
                  Future.delayed(Duration(seconds: 2)).then((value) {
                    // Get.back();
                    Get.snackbar("Offer sent", "Your offer sent successfully");
                  });
                },
              ),
              SizedBox(
                height: blockHeight * 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
