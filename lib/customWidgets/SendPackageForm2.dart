import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/PackageDepartureDetails.dart';

import '../globals.dart';

class SendPackageForm2 extends StatefulWidget {
  SendPackageForm2({Key key}) : super(key: key);

  @override
  _SendPackageForm2State createState() => _SendPackageForm2State();
}

class _SendPackageForm2State extends State<SendPackageForm2> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: blockHeight * 5,
          // color: Colors.green,
        ),
        PackageDepartureDetails(),
      ],
    );
  }
}
