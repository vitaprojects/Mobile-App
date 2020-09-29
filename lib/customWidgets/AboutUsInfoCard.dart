import 'package:flutter/material.dart';

import '../globals.dart';

class AboutUsInfoCard extends StatelessWidget {
  AboutUsInfoCard({
    this.title,
    this.icon,
  });
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      elevation: 20,
      margin: EdgeInsets.symmetric(
        horizontal: blockWidth * 5,
      ),
      child: Container(
        height: blockHeight * 8,
        // color: Colors.redAccent,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: blockWidth * 3),
        child: Row(
          children: [
            Container(
              width: blockWidth * 20,
              // color: Colors.red,
              alignment: Alignment.center,
              child: icon,
            ),
            Expanded(
                child: Container(
              // color: Colors.yellow,
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
