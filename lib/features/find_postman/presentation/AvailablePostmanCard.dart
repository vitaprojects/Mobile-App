import 'package:flutter/material.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:newpostman1/useful/globals.dart';

class AvailablePostmanCard extends StatelessWidget {
  AvailablePostmanCard({@required this.itenaryModel});

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final margin = Globals.blockWidth * 5;
  final ItenaryModel itenaryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("send this person a request");
      },
      child: Card(
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
                color: Globals.mainColor,
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
              Container(
                color: Colors.greenAccent,
                width: blockWidth * 2,
              ),
              Expanded(
                  child: Container(
                // color: Colors.yellowAccent,
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        height: blockHeight * 4,
                        color: Colors.greenAccent,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          itenaryModel.details.email,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
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
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                // color: Colors.orange,
                                alignment: Alignment.centerLeft,
                                child: Text(itenaryModel
                                    .details?.departureLocation?.address),
                              ),
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
                                "Final Destination",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                // color: Colors.orange,
                                alignment: Alignment.centerLeft,
                                child: Text(itenaryModel
                                    .details?.destinationLocation?.address),
                              ),
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
      ),
    );
  }
}
