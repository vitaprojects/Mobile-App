import 'package:flutter/material.dart';
import 'package:newpostman1/features/find_postman/data/RequestModel.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:stacked/stacked.dart';

import 'CustomerRequestForErrandViewModel.dart';

class CustomerRequestForErrandView extends StatelessWidget {
  CustomerRequestForErrandView({this.requestModel});
  final RequestModel requestModel;
  final double blockHeight = Globals.blockHeight;

  final double blockWidth = Globals.blockWidth;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerRequestForErrandViewModel>.reactive(
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(),
        );
      },
      viewModelBuilder: () => CustomerRequestForErrandViewModel(),
    );
  }
}
