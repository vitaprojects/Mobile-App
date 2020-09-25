import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/SendPackageForm1.dart';

import '../globals.dart';

class SendPackage extends StatefulWidget {
  SendPackage({Key key}) : super(key: key);

  @override
  _SendPackageState createState() => _SendPackageState();
}

class _SendPackageState extends State<SendPackage> {
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
              stretchTriggerOffset: 200,
              backgroundColor: Colors.white,
              stretch: true,
              expandedHeight: blockHeight * 40,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Send Package",
                  style: TextStyle(
                    // fontSize: 2,
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                  StretchMode.blurBackground,
                ],
                background: Image.asset(
                  "assets/images/sendPackage.png",
                  height: blockHeight * 32,
                  width: blockWidth * 70,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              SendPackageForm1(),
            ]))
          ],
        ),
      ),
    );
  }
}
