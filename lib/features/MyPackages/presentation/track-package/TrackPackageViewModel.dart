import 'package:newpostman1/features/MyPackages/domain/posted_packages_service.dart';
import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

class TrackPackageViewModel extends StreamViewModel<List<OrderModel>> {
  PostedPackagesService postedPackagesService =
      locator<PostedPackagesService>();
  @override
  Stream<List<OrderModel>> get stream =>
      postedPackagesService.getAllOngoingOrders();
}
