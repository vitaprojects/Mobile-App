import 'package:flutter/material.dart';
import 'package:newpostman1/globals.dart';
import 'package:newpostman1/ui/WelcomeScreen.dart';

import '../sizeConfig.dart';

class RootWidget extends StatelessWidget {
  //this root widget is created to store the value of the blockHright and blockWidth globally in the beginning
  const RootWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double blockHeight = SizeConfig.safeBlockVertical;
    double blockWidth = SizeConfig.safeBlockHorizontal;

    Globals.addBlockHeightAndWidth(blockHeight, blockWidth);

    return SafeArea(
      child: Scaffold(
        body: WelcomeScreen(),
      ),
    );
  }
}
