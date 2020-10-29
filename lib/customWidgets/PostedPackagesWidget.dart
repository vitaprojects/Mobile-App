import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/TripDetailsCard.dart';

import '../useful/globals.dart';

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
