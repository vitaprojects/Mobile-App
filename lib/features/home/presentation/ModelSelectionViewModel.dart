import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/post_errand/data/RunErrandModel.dart';
import 'package:newpostman1/features/post_errand/domain/ErrandService.dart';
import 'package:newpostman1/features/post_errand/presentation/PostYourErrand.dart';
import 'package:newpostman1/features/post_itenary/presentation/PostYourItenary.dart';
import 'package:newpostman1/features/send_package/presentation/SendPackage.dart';
import 'package:newpostman1/useful/service_locator.dart';

class ModeSelectionViewModel extends ChangeNotifier {
  final ErrandService errandService = locator<ErrandService>();
  void navigateToPage(int type) {
    if (type == 0) {
      print("go to post itenary");

      Get.to(PostYourItenary());
    } else if (type == 1) {
      print("go to send package");

      Get.to(SendPackage());
    } else if (type == 2) {
      print("go to errand page");
      Get.to(PostYourErrand());
    }
  }

  void runForErrand() {
    print("run for the errand");
    errandService.postAvailablityForErrand();
  }
}
