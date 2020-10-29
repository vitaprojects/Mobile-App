import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SnackBarService {
  showSnackBar(String title, String body, bool isDanger);
  goBackAfterTimePeriod(String title, String body, bool isDanger);
}

class SnackBarServiceImpl extends SnackBarService {
  @override
  showSnackBar(String title, String body, bool isDanger) {
    Get.snackbar(
      title,
      body,
      backgroundColor: Colors.white,
      icon: (isDanger == true)
          ? Icon(
              Icons.error,
              color: Colors.red,
            )
          : Icon(
              Icons.done,
              color: Colors.green,
            ),
    );
  }

  @override
  goBackAfterTimePeriod(String title, String body, bool isDanger) {
    Get.back();
    Future.delayed(Duration(seconds: 2)).then((value) {
      showSnackBar(title, body, isDanger);
    }).catchError((onError) {});
  }
}
