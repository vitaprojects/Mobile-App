import 'package:flutter/material.dart';
import 'package:newpostman1/useful/globals.dart';

import '../useful/sizeConfig.dart';

class RootWidget extends StatelessWidget {
  ///this root widget is created to store the value of the [`blockHeight`] and [`blockWidth`] globally in the beginning

  RootWidget({@required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double blockHeight = SizeConfig.safeBlockVertical;
    double blockWidth = SizeConfig.safeBlockHorizontal;

    Globals.addBlockHeightAndWidth(blockHeight, blockWidth);

    return SafeArea(
      child: Scaffold(
        body: child,
      ),
    );
  }
}
