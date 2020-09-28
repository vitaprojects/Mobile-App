import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../globals.dart';

class CustomInputField extends StatefulWidget {
  CustomInputField({
    this.attribute,
    this.labelText,
    this.textEditingController,
    this.isDescription,
    this.isInternalField,
    this.isDate,
  });
  final String attribute;
  final String labelText;
  final TextEditingController textEditingController;
  final bool
      isDescription; //this is set to true if this field is to add a description
  final bool isInternalField;
  final bool isDate; //to check whether we are enter a date
  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (widget.isInternalField == true) {
          if (widget.isDate == true) {
            return Container(
              height: blockHeight * 10,
              // color: Colors.red,
              alignment: Alignment.center,
              child: FormBuilderDateTimePicker(
                controller: widget.textEditingController,
                attribute: widget.attribute,
                // textAlignVertical: TextAlignVertical.center,
                // maxLines: (widget.isDescription == true) ? null : 2,
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
            );
          } else {
            return Container(
              height: (widget.isDescription == true)
                  ? blockHeight * 15
                  : blockHeight * 10,
              // color: Colors.red,
              alignment: Alignment.center,
              child: FormBuilderTextField(
                controller: widget.textEditingController,
                attribute: widget.attribute,
                textAlignVertical: TextAlignVertical.center,
                maxLines: (widget.isDescription == true) ? null : 2,
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
            );
          }
        } else {
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
              height: (widget.isDescription == true)
                  ? blockHeight * 15
                  : blockHeight * 10,
              // color: Colors.red,
              alignment: Alignment.center,
              child: FormBuilderTextField(
                controller: widget.textEditingController,
                attribute: widget.attribute,
                textAlignVertical: TextAlignVertical.center,
                maxLines: (widget.isDescription == true) ? null : 2,
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
      },
    );
  }
}
