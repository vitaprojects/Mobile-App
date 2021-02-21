import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:newpostman1/features/TotalEarnings/presentation/totalEarningsWidgetViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';

class TotalEarningsOverviewSelectionWidget extends StatefulWidget {
  TotalEarningsOverviewSelectionWidget(
      {Key key, this.indexValue = 0, @required this.onChanged})
      : super(key: key);
  final int indexValue;
  final ValueChanged<int> onChanged;
  @override
  _TotalEarningsOverviewSelectionWidgetState createState() =>
      _TotalEarningsOverviewSelectionWidgetState();
}

class _TotalEarningsOverviewSelectionWidgetState
    extends State<TotalEarningsOverviewSelectionWidget> {
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  double margin;

  @override
  Widget build(BuildContext context) {
    margin = blockWidth * 5;
    return Container(
      height: blockHeight * 28,
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(child: Container()),
          Card(
            elevation: 20,
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      20,
                    ),
                    bottomRight: Radius.circular(
                      20,
                    ))),
            color: Globals.mainColor,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: margin,
              ),
              decoration: BoxDecoration(),
              height: blockHeight * 8,
              alignment: Alignment.center,
              child: Container(
                height: blockHeight * 5,
                // color: Colors.redAccent,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: blockWidth * 30,
                      // color: Colors.green,
                      alignment: Alignment.center,
                      child: Container(
                        height: blockHeight * 3,
                        // color: Colors.yellow,
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          "Overview",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          minFontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                        width: blockWidth * 30,
                        // color: Colors.green,
                        alignment: Alignment.center,
                        // child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "All",
                        // style: TextStyle(
                        //   fontSize: 18,
                        //   color: Colors.white,
                        // ),
                        //     ),
                        // Icon(
                        //   Icons.arrow_drop_down,
                        // )
                        //   ],
                        // ),
                        child: DropdownButton(
                          // icon: Icon(
                          //   Icons.arrow_drop_down,
                          // ),

                          items: <int>[0, 1, 2]
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e == 0
                                        ? 'All'
                                        : e == 1
                                            ? 'Month'
                                            : 'Day',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  )))
                              .toList(),
                          isExpanded: true,
                          dropdownColor: Globals.mainColor,
                          iconSize: 30,
                          underline: Offstage(),
                          onChanged: widget.onChanged,
                          value: widget.indexValue,
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
