import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/SendPackage/FinalPackageDetailsWidget.dart';
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
                ],
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
