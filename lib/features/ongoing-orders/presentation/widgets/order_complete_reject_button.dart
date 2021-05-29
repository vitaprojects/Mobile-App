import 'package:flutter/material.dart';
import 'package:newpostman1/useful/globals.dart';

class OrderCompleteRejectButton extends StatelessWidget {
  OrderCompleteRejectButton({
    @required this.btnText,
    @required this.btnType,
    @required this.callback,
  });
  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;

  final double margin = Globals.blockWidth * 5;
  final String btnText;
  final int btnType;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(0),
      color: btnType == 0 ? Colors.blue : Colors.redAccent,
      onPressed: () {
        callback();
      },
      child: Container(
        width: blockWidth * 40,
        height: blockHeight * 10,
        // color: Colors.yellow,
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
