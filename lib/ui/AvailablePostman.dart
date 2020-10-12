import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class AvailablePostman extends StatefulWidget {
  AvailablePostman();

  @override
  _AvailablePostmanState createState() => _AvailablePostmanState();
}

class _AvailablePostmanState extends State<AvailablePostman> {
  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;

  double margin;

  @override
  Widget build(BuildContext context) {
    margin = blockWidth * 5;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: blockHeight * 10,
              // color: Colors.redAccent,
              margin: EdgeInsets.symmetric(
                horizontal: margin,
              ),
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 5,
                // color: Colors.greenAccent,
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  "Available Postmans",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  minFontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.yellow,
                // margin: EdgeInsets.symmetric(
                //   horizontal: margin,
                // ),
                alignment: Alignment.center,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        10,
                      )),
                      elevation: 15,
                      margin: EdgeInsets.only(
                        bottom: blockHeight * 2,
                        left: margin,
                        right: margin,
                      ),
                      child: Container(
                        height: blockHeight * 15,
                        // color: Colors.greenAccent,

                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Container(
                              width: blockHeight * 15,
                              // color: Colors.orangeAccent,
                              padding: EdgeInsets.all(
                                blockHeight * 2,
                              ),
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  "assets/images/user.png",
                                ),
                                radius: blockHeight * 7,
                              ),
                            ),
                            SizedBox(
                              width: blockWidth * 2,
                            ),
                            Expanded(
                                child: Container(
                              // color: Colors.yellowAccent,
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  Container(
                                    height: blockHeight * 4,
                                    // color: Colors.greenAccent,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Harry Potter",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: blockHeight * 5.5,
                                    color: Colors.grey,
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            // color: Colors.yellow,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Departure",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            // color: Colors.orange,
                                            alignment: Alignment.centerLeft,
                                            child: Text("London"),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: blockHeight * 5.5,
                                    color: Colors.grey.shade400,
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            // color: Colors.yellow,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Departure",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            // color: Colors.orange,
                                            alignment: Alignment.centerLeft,
                                            child: Text("London"),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: blockHeight * 5,
            )
          ],
        ),
      ),
    );
  }
}
