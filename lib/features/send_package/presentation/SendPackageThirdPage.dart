import 'dart:io';

import 'package:flutter/material.dart';

import '../../../useful/globals.dart';
import 'SendPackageForm3.dart';

class SendPackageThirdPage extends StatefulWidget {
  SendPackageThirdPage({@required this.packageImages});
  final List<File> packageImages;

  @override
  _SendPackageThirdPageState createState() => _SendPackageThirdPageState();
}

class _SendPackageThirdPageState extends State<SendPackageThirdPage> {
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
                  "Receiver Details",
                  style: TextStyle(
                    // fontSize: 2,
                    color: Colors.black,
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
              SendPackageForm3(
                packageImages: widget.packageImages,
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
