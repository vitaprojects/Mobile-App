import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newpostman1/features/send_package/data/PackageModel.dart';
import 'package:newpostman1/features/send_package/domain/bloc/SendPackageBloc.dart';

import '../../../useful/globals.dart';
import 'SendPackageForm1.dart';

class SendPackage extends StatefulWidget {
  SendPackage({Key key}) : super(key: key);

  @override
  _SendPackageState createState() => _SendPackageState();
}

class _SendPackageState extends State<SendPackage> {
  @override
  Widget build(BuildContext context) {
    final double blockHeight = Globals.blockHeight;
    final double blockWidth = Globals.blockWidth;

    return BlocProvider<SendPackageBloc>(
      create: (context) => SendPackageBloc(PackageModel()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                stretchTriggerOffset: 100,
                backgroundColor: Colors.white,
                stretch: true,
                expandedHeight: blockHeight * 20,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "Package Details",
                    style: TextStyle(
                      // fontSize: 2,
                      // color: Globals.mainColor,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  centerTitle: true,
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.fadeTitle,
                    StretchMode.blurBackground,
                  ],
                  // background: Image.asset(
                  //   "assets/images/sendPackage.png",
                  //   height: blockHeight * 32,
                  //   width: blockWidth * 70,
                  //   fit: BoxFit.contain,
                  // ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                SendPackageForm1(),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
