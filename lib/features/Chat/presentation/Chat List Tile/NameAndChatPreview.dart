import 'package:flutter/material.dart';
import 'package:newpostman1/useful/globals.dart';

class NameAndChatPreview extends StatelessWidget {
  NameAndChatPreview({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: blockWidth * 2,
            vertical: blockHeight,
          ),
          // color: Colors.grey,
          alignment: Alignment.centerLeft,
          child: SizedBox(
            child: Container(
              // color: Colors.greenAccent,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    height: blockHeight * 3,
                    // color: Colors.yellowAccent,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Dulaj Michael",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: blockHeight,
                  ),
                  Container(
                    height: blockHeight * 4,
                    // color: Colors.orangeAccent,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "hi how are  hi how are you  hi how are  hi how are you   hi how are  hi how are you   hi how are  hi how are you  ?",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
