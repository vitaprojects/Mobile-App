import 'package:newpostman1/models/earningsModel.dart';

abstract class TotalEarningsService {
  ///*[`getAllEarnings`] this method fetches the data from the users collection
  Stream<EarningsModel> get getAllEarnings;

  ///[`getMonthEarnings`] gets the current months earnings
  Stream<EarningsModel> get getMonthEarnings;

  ///[`getDayEarnings`] gets the current days earnings
  Stream<EarningsModel> get getDayEarnings;
}
