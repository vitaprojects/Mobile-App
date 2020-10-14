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
    this.isPhone,
    this.readOnly,
    this.initalText,
  });

  final String attribute;
  final String labelText;
  final TextEditingController textEditingController;
  final bool
      isDescription; //this is set to true if this field is to add a description
  final bool isInternalField;
  final bool isDate; //to check whether we are enter a date
  final bool isPhone;
  final bool
      readOnly; //if we want to make the textfield read only we pass this as true
  final String
      initalText; //if we want to show a inital value in the text field pass the value here
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
                    labelText: widget.labelText,
                    contentPadding: EdgeInsets.only(
                      left: blockWidth * 3,
                    )),
              ),
            );
          } else if (widget.isPhone == true) {
            return Container(
              height: blockHeight * 10,
              // color: Colors.red,
              alignment: Alignment.center,
              child: FormBuilderTextField(
                keyboardType: TextInputType.number,
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
                    labelText: widget.labelText,
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
                    labelText: widget.labelText,
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
                // textAlign: TextAlign.center,
                initialValue:
                    (widget.initalText == null) ? '' : widget.initalText,
                readOnly: widget.readOnly == true,
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
                    labelText: widget.labelText,
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
