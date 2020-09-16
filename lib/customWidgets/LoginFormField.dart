import 'package:flutter/material.dart';

import '../globals.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({this.icon, this.hintText});
  final IconData icon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Container(
      height: blockHeight * 10,
      // color: Colors.grey,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: blockWidth * 2,
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
          ),
          // suffixIcon: Icon(
          //   Icons.ac_unit,
          // ),
        ),
      ),
    );
  }
}
