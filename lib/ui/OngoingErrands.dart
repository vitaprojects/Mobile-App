import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/errands/OngoingErrandsCard.dart';

import '../useful/globals.dart';

class OngoingErrands extends StatelessWidget {
  OngoingErrands({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Globals.mainColor,
            title: Text("Ongoing Errands"),
          ),
          body: Column(
            children: [
              Container(
                height: blockHeight * 5,
                // color: Colors.yellow,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return OngoingErrandsCard();
                  },
                ),
              )
            ],
          )),
    );
  }
}
