import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';

abstract class PostedPackagesService {
  Stream<List<FullPackageModel>> getAllPostedPackages();

  ///This will return all the available packages as a stream
  Stream<List<FullPackageModel>> getAllAvailbePackages();

  Stream<List<OrderModel>> getAllOngoingOrders();
}
