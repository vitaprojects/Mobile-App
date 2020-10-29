import 'package:flutter/material.dart';

import '../../../useful/globals.dart';

class ItemWidgetInDrawer extends StatelessWidget {
  ItemWidgetInDrawer({
    this.title,
    this.margin,
    this.icon,
    this.ontapFunc,
  });
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final double margin;
  final String title;
  final Icon icon;
  final VoidCallback ontapFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontapFunc();
      },
      child: Container(
        height: blockHeight * 6,
        // color: Colors.blueAccent,
        alignment: Alignment.center,
        child: Container(
          height: blockHeight * 4,
          // color: Colors.orange,
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                width: blockHeight * 6,
                // color: Colors.yellow,
                alignment: Alignment.center,
                child: icon,
              ),
              SizedBox(
                width: blockWidth * 5,
              ),
              Expanded(
                  child: Container(
                // color: Colors.green,
                alignment: Alignment.centerLeft,
                child: Container(
                  height: blockHeight * 3,
                  // color: Colors.yellow,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
