import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../useful/globals.dart';

class EarningsInfoCard extends StatelessWidget {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final int cardType;
  final String text;

  EarningsInfoCard({Key key, @required this.cardType, this.text = "0"})
      : assert(cardType != null, 'Card type cannot be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          10,
        )),
        margin: EdgeInsets.all(
          0,
        ),
        color: (cardType == 0)
            ? Colors.amber
            : (cardType == 1)
                ? Colors.black
                : Colors.redAccent,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                height: blockHeight * 5,
                // color: Colors.blueAccent,
                alignment: Alignment.center,
                child: Container(
                  height: blockHeight * 4,
                  // color: Colors.yellow,
                  alignment: Alignment.center,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      if (cardType == 0) {
                        return Icon(
                          FontAwesomeIcons.clipboardCheck,
                          color: Colors.white,
                        );
                      } else if (cardType == 1) {
                        return Icon(
                          FontAwesomeIcons.ban,
                          color: Colors.white,
                        );
                      } else {
                        return Icon(
                          FontAwesomeIcons.calendarCheck,
                          color: Colors.white,
                        );
                      }
                    },
                  ),
                ),
              ),
              Container(
                height: blockHeight * 5,
                // color: Colors.greenAccent,
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: blockHeight * 5,
                // color: Colors.grey,
                alignment: Alignment.center,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (cardType == 0) {
                      return Text(
                        "Completed Jobs",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      );
                    } else if (cardType == 1) {
                      return Text(
                        "Cancelled Jobs",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return Text(
                        "Active Jobs",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
