import 'package:flutter/foundation.dart';
import 'package:newpostman1/features/withdraw/data/datasources/withdraw_data_source.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/observables/user_data_observable.dart';
import 'package:stacked/stacked.dart';

class WithdrawViewModel extends MultipleStreamViewModel
    implements ReactiveViewModel {
  final UserData userData;
  final WithdrawDataSource withdrawDataSource;
  WithdrawViewModel(
      {@required this.userData, @required this.withdrawDataSource});
  static const String userDataChangesKey = 'userDataChangesKey';
  @override
  List<ReactiveServiceMixin> get reactiveServices => [userData];
  UserModel get userModel => dataMap[userDataChangesKey];
  @override
  Map<String, StreamData> get streamsMap => {
        userDataChangesKey: StreamData<UserModel>(userData.userModel.values),
      };
  @override
  void onData(String key, data) {
    super.onData(key, data);
    if (key == userDataChangesKey) {}
  }

  Future<void> createStripeAccount() async {
    setBusy(true);
    await withdrawDataSource.createStripeConnectedAccount();
    setBusy(false);
  }
}
