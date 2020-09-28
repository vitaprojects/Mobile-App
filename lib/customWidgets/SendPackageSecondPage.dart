import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/SendPackageForm2.dart';

import '../globals.dart';

class SendPackageSecondPage extends StatefulWidget {
  SendPackageSecondPage({Key key}) : super(key: key);

  @override
  _SendPackageSecondPageState createState() => _SendPackageSecondPageState();
}

class _SendPackageSecondPageState extends State<SendPackageSecondPage> {
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
                  "Send Package",
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
              SendPackageForm2(),
            ]))
          ],
        ),
      ),
    );
  }
}
