import 'package:flutter/widgets.dart';
import 'package:newpostman1/features/find_postman/domain/find_available_postman_service.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';
import 'package:newpostman1/useful/service_locator.dart';

class AvailablePostmanViewModel extends ChangeNotifier {
  FullPackageModel latestPackage;
  final FindAvailablePostmanService findAvailablePostmanService =
      locator<FindAvailablePostmanService>();

  initialize() async {
    latestPackage =
        await findAvailablePostmanService.getInfoAboutLatestPackage();
    print(latestPackage.datePosted);
    notifyListeners();
  }
}
