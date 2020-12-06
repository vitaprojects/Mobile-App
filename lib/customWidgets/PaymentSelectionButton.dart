import 'package:flutter/material.dart';
import 'package:newpostman1/useful/globals.dart';

class PaymentSelectionButton extends StatelessWidget {
  PaymentSelectionButton({
    @required this.assetUrl,
    @required this.callback,
  });
  final String assetUrl;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      color: Colors.white,
      padding: EdgeInsets.all(
        0,
      ),
      onPressed: () {
        callback();
      },
      elevation: 15,
      // margin: EdgeInsets.all(0),
      child: Container(
        width: blockWidth * 25,
        // color: Colors.greenAccent,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: blockWidth * 2, vertical: blockHeight),
        child: SizedBox.expand(
          child: Container(
            // color: Colors.orange,
            alignment: Alignment.center,
            child: Image.asset(
              assetUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
