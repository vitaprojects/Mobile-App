import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/DisplayErrandsWidget.dart';

import '../useful/globals.dart';

class FindLocalErrands extends StatefulWidget {
  FindLocalErrands({Key key}) : super(key: key);

  @override
  _FindLocalErrandsState createState() => _FindLocalErrandsState();
}

class _FindLocalErrandsState extends State<FindLocalErrands> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Globals.mainColor,
            bottom: TabBar(
              tabs: [
                Tab(
                  // icon: Icon(Font),
                  child: Text(
                    "Errands".toUpperCase(),
                  ),
                ),
                // Tab(
                //   // icon: Icon(Icons.directions_transit),
                //   child: Text(
                //     "completed".toUpperCase(),
                //   ),
                // ),
              ],
            ),
            title: Text(
              'Find local errands',
              textAlign: TextAlign.center,
            ),
          ),
          body: TabBarView(
            children: [
              DisplayErrandsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
