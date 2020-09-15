import 'package:flutter/material.dart';
import 'package:newpostman1/globals.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Globals.blockHeight);
    print(Globals.blockWidth);
    return SafeArea(
        child: Scaffold(
      body: Column(),
    ));
  }
}
