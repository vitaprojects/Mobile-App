import 'package:flutter/widgets.dart';
import 'package:newpostman1/features/MyPackages/domain/posted_packages_service.dart';
import 'package:newpostman1/useful/service_locator.dart';

class PostedPackagesViewModel extends ChangeNotifier {
  final PostedPackagesService postedPackagesService =
      locator<PostedPackagesService>();
}
