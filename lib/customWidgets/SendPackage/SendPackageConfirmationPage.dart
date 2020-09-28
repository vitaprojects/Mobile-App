import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/customWidgets/SendPackage/FinalPackageDetailsWidget.dart';
import 'package:newpostman1/customWidgets/SendPackage/SenderInformationCard.dart';
import 'package:newpostman1/customWidgets/SendPackage/SenderReceiverInformationWidget.dart';
import 'package:newpostman1/customWidgets/SendPackage/UploadedImagesOfPackage.dart';
import 'package:newpostman1/ui/ThankYouWidget.dart';
import 'package:newpostman1/ui/TripDetailRowCard.dart';

import '../../globals.dart';

class SendPackageConfirmationPage extends StatelessWidget {
  const SendPackageConfirmationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              stretchTriggerOffset: 100,
              backgroundColor: Colors.white,
              stretch: true,
              expandedHeight: blockHeight * 20,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Confirmation",
                  style: TextStyle(
                    // fontSize: 2,
                    color: Globals.mainColor,
                    fontSize: 25,
                  ),
                ),
                centerTitle: true,
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                  StretchMode.blurBackground,
                ],
                // background: Image.asset(
                //   "assets/images/sendPackage.png",
                //   height: blockHeight * 32,
                //   width: blockWidth * 70,
                //   fit: BoxFit.contain,
                // ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: [
                  FinalPackageDetailsWidget(),
                  SizedBox(
                    height: blockHeight * 2,
                  ),
                  UploadedImagesOfPackage(),
                  SizedBox(
                    height: blockHeight * 2,
                  ),
                  SenderReceiverInformationWidget(),
                  SizedBox(
                    height: blockHeight * 2,
                  ),
                  FormButton(
                    buttonText: "confirm shipment",
                    ontapFun: () {
                      Get.to(ThankYouWidget(
                        typeOfThankYou: 1,
                      ));
                    },
                  ),
                  SizedBox(
                    height: blockHeight * 5,
                  )
                ],
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
