import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../globals.dart';

class CustomInputField extends StatefulWidget {
  CustomInputField(
      {this.attribute, this.labelText, this.textEditingController});
  final String attribute;
  final String labelText;
  final TextEditingController textEditingController;

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      margin: EdgeInsets.all(
        0,
      ),
      child: Container(
        height: blockHeight * 10,
        // color: Colors.red,
        alignment: Alignment.center,
        child: FormBuilderTextField(
          controller: widget.textEditingController,
          attribute: widget.attribute,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              // filled: true,
              // fillColor: Colors.green,
              labelStyle: TextStyle(
                color: Globals.mainColor,
              ),
              border: InputBorder.none,
              labelText: widget.labelText.toUpperCase(),
              contentPadding: EdgeInsets.only(
                left: blockWidth * 3,
              )),
        ),
      ),
    );
  }
}
