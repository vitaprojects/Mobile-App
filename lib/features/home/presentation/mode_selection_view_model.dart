import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/post_errand/domain/ErrandService.dart';
import 'package:newpostman1/features/post_errand/presentation/PostYourErrand.dart';
import 'package:newpostman1/features/post_itinerary/presentation/post_your_Itinerary.dart';
import 'package:newpostman1/features/send_package/presentation/SendPackage.dart';
import 'package:newpostman1/useful/service_locator.dart';

class ModeSelectionViewModel extends ChangeNotifier {
  final ErrandService errandService = locator<ErrandService>();
  void navigateToPage(int type) {
    if (type == 0) {
      print("go to post itenary");

      Get.to(PostYourItinerary());
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
