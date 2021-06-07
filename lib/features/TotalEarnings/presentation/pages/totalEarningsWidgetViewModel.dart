import 'package:newpostman1/features/TotalEarnings/data/total_earnings_service.dart';
import 'package:newpostman1/models/earningsModel.dart';
import 'package:newpostman1/observables/user_data_observable.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

class TotalEarningsWidgetViewModel extends ReactiveViewModel {
  final earningslocatior = locator<TotalEarningsService>();

  final UserData userData = locator<UserData>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [userData];

  ///* this is the drop down selection view
  ///[`0`] its initial value and its stands for getting all the earnings which is in the users collection
  ///[`1`] getting the current months earning
  ///[`2`] getting the current days earnings

  String get totalEarning => (userData.userModel?.value != null)
      ? userData.userModel.value.totalEarnings.toStringAsFixed(2)
      : "0";
  // listenToChangesInUserModel() {
  //   userData.userModel.listen((v) {
  //     if (v != null) {
  //       if (v.totalEarnings != 0) {
  //         totalEarnings = v.totalEarnings;
  //         notifyListeners();
  //       }
  //     }
  //   });
  // }

  int _overView = 0;
  // EarningsModel get getData => data;

  int get indexVal => _overView;

  ///* this method is to change the drop down index value as well as to change the  streams too
  // updateOverView(int val) async {
  //   _overView = val;
  //   notifySourceChanged();
  // }

  // @override
  // Stream<EarningsModel> get stream => _overView == 0
  //     ? earningslocatior.getAllEarnings
  //     : _overView == 1
  //         ? earningslocatior.getMonthEarnings
  //         : earningslocatior.getDayEarnings;

  // @override
  // void initialise() {
  //   super.initialise();
  // }
}
