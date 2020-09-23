import 'package:flutter/material.dart';

import '../globals.dart';

class ICanPickUpWidget extends StatefulWidget {
  ICanPickUpWidget({
    this.onChoiceSelected,
  });
  final Function(bool) onChoiceSelected;

  @override
  _ICanPickUpWidgetState createState() => _ICanPickUpWidgetState();
}

class _ICanPickUpWidgetState extends State<ICanPickUpWidget> {
  bool _isSelected = false;

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
        height: blockHeight * 8,
        // color: Colors.orange,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: blockHeight * 6,
              // color: Colors.red,
              alignment: Alignment.center,
              child: CheckboxListTile(
                contentPadding: EdgeInsets.all(
                  0,
                ),
                checkColor: Globals.mainColor,
                selected: _isSelected == true,
                title: Text(
                  "I can pickup",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                value: _isSelected,
                onChanged: (newValue) {
                  setState(() {
                    //  checkedValue = newValue;
                    _isSelected = newValue;
                    widget.onChoiceSelected(_isSelected);
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
          ],
        ),
      ),
    );
  }
}
