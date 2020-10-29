import 'package:flutter/material.dart';

import '../../../globals.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({
    this.icon,
    this.hintText,
    this.isPassword,
  });
  final IconData icon;
  final String hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        15,
      )),
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      child: Container(
        height: blockHeight * 10,
        // color: Colors.grey,
        alignment: Alignment.center,

        padding: EdgeInsets.symmetric(
          horizontal: blockWidth * 2,
        ),
        child: TextFormField(
          obscureText:
              (isPassword != null && isPassword == true) ? true : false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              icon,
            ),
            suffixIcon: (isPassword != null && isPassword == true)
                ? IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {},
                  )
                : null,
            // suffixIcon: Icon(
            //   Icons.ac_unit,
            // ),
          ),
        ),
      ),
    );
  }
}
