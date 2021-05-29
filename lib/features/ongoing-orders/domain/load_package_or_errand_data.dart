import 'package:newpostman1/features/home/data/OrderModel.dart';

///This class is used to Load Package Or Errand Data
abstract class LoadPackageOrErrandData {
  ///This function is used to load package or errand data when the doc id is given
  Future loadPackageOrErrandDataWhenIdIsGiven(String docId, int type);

  Future<void> completeOrRejectTheOrder(
      OrderModel orderModel, int responseType, double amountEarned);
}
