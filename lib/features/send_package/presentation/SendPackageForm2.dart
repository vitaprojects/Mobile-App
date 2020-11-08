import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:newpostman1/customWidgets/CustomInputField.dart';
import 'package:newpostman1/customWidgets/FormButton.dart';
import 'package:newpostman1/features/send_package/data/PackageModel.dart';
import 'package:newpostman1/features/send_package/domain/bloc/SendPackageBloc.dart';
import 'package:newpostman1/features/send_package/presentation/SendPackageViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../useful/globals.dart';
import 'PackageDepartureDetails.dart';
import 'PackageFinalDestDetails.dart';
import 'SendPackageThirdPage.dart';

class SendPackageForm2 extends StatelessWidget {
  SendPackageForm2({@required this.packageImages});

  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final List<File> packageImages;

  // final PackageModel packageModelFromForm1;
  // final List<File> imagesOfTheItem;

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<SendPackageBloc>(context);
    return ViewModelBuilder<SendPackageViewModel>.nonReactive(
        disposeViewModel: false,
        builder: (context, model, child) {
          return Column(
            children: [
              Container(
                height: blockHeight * 5,
                // color: Colors.green,
              ),
              PackageDepartureDetails(),
              SizedBox(
                height: blockHeight * 2,
              ),
              PackageFinalDestDetails(),
              // SizedBox(
              //   height: blockHeight * 2,
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //     horizontal: blockWidth * 5,
              //   ),
              //   child: CustomInputField(
              //     attribute: "postageCost",
              //     labelText: "Enter postage cost",
              //   ),
              // ),
              SizedBox(
                height: blockHeight * 5,
              ),
              FormButton(
                buttonText: "next",
                ontapFun: () {
                  // Get.to(SendPackageThirdPage());
                  model.submitValuesInForm2(context, packageImages);
                },
              ),
              SizedBox(
                height: blockHeight * 10,
              ),
            ],
          );
        },
        viewModelBuilder: () => SendPackageViewModel());
  }
}
