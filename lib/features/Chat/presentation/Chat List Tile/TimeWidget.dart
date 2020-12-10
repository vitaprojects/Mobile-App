import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpostman1/useful/globals.dart';

class TimeWidget extends StatelessWidget {
  TimeWidget({Key key}) : super(key: key);
  //this will show which time the user has sent or received a message
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: blockHeight * 3,
      // color: Colors.greenAccent,
      alignment: Alignment.center,
      child: Text(
        "18.30",
        style: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
