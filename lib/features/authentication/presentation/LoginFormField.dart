import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../useful/globals.dart';

class LoginFormField extends StatefulWidget {
  const LoginFormField({
    this.icon,
    this.hintText,
    this.isPassword,
    this.attribute,
    this.controller,
  });
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final String attribute;
  final TextEditingController controller;

  @override
  _LoginFormFieldState createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      decoration: BoxDecoration(
          // color: Color(
          //   0xffaffde4,
          // ),
          borderRadius: BorderRadius.circular(
        15,
      )),
      height: blockHeight * 12,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      child: FormBuilderTextField(
        textInputAction: TextInputAction.next,
        obscureText: (widget.isPassword == true) ? hidePassword : false,
        controller: widget.controller,
        attribute: widget.attribute,
        // validators: [
        //   FormBuilderValidators.email(),
        //   FormBuilderValidators.required(),
        // ],
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(
            0xffaffde4,
          ),
          hintText: widget.hintText,
          prefixIcon: Icon(
            widget.icon,
          ),
          suffixIcon: (widget.isPassword == true)
              ? IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                  ),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Globals.mainColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: Globals.mainColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
