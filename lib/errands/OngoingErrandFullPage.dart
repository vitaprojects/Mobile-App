import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/errands/ErrandFieldCard.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:map_launcher/map_launcher.dart';

class OngoingErrandsFullPage extends StatelessWidget {
  OngoingErrandsFullPage({Key key}) : super(key: key);
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    double margin = blockWidth * 5;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Globals.mainColor,
          title: Text("Ongoing Errand"),
        ),
        body: Column(
          children: [
            Container(
              height: blockHeight * 2,
            ),
            ErrandFieldCard(
              fieldTitle: "Errand ID",
              bodyText: "12345678",
            ),
            Container(
              // color: Colors.orange,
              height: blockHeight * 2,
            ),
            ErrandFieldCard(
              fieldTitle: "Errand PickUp",
              bodyText: "NY , USA",
            ),
            Container(
              height: blockHeight * 2,
            ),
            ErrandFieldCard(
              fieldTitle: "Errand Drop Location",
              bodyText: "NY , USA",
            ),
            Container(
              height: blockHeight * 2,
            ),
            ErrandFieldCard(
              fieldTitle: "Errand Details",
              bodyText: "Pick some groceries from walmart",
            ),
            Container(
              height: blockHeight * 2,
            ),
            ErrandFieldCard(
              fieldTitle: "Distance",
              bodyText: "2 KM",
            ),
            Container(
              height: blockHeight * 5,
            ),
            FormButton(
              buttonText: "Get Direction",
              ontapFun: () async {
                final availableMaps = await MapLauncher.installedMaps;

                await availableMaps.first.showMarker(
                  coords: Coords(37.759392, -122.5107336),
                  title: "Ocean Beach",
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
