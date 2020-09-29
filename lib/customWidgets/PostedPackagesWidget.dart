import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newpostman1/customWidgets/TripDetailsCard.dart';
import 'package:newpostman1/ui/TripDetailRowCard.dart';

import '../globals.dart';

class PostedPackagesWidget extends StatefulWidget {
  PostedPackagesWidget({Key key}) : super(key: key);

  @override
  _PostedPackagesWidgetState createState() => _PostedPackagesWidgetState();
}

class _PostedPackagesWidgetState extends State<PostedPackagesWidget> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: blockHeight * 2,
            ),
            TripDetailsCard(
              isPackage: true,
            ),
            TripDetailsCard(
              isPackage: true,
            ),
            TripDetailsCard(
              isPackage: true,
            ),
            TripDetailsCard(
              isPackage: true,
            ),
          ],
        ),
      ),
    );
  }
}
