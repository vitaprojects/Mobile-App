import 'package:logger/logger.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

///This class was created to listen to user model as a observable
class UserData with ReactiveServiceMixin {
  final userModel = RxValue<UserModel>(initial: null);

  ///This class was created to listen to user model as a observable

  UserData() {
    listenToReactiveValues([userModel]);
  }

  ///This function is used to assign value to the observable
  void setUserDataModel(UserModel userModelV) {
    userModel.value = userModelV;
    Logger().i("Data saved in userdata observable");
  }

  void clearData() {
    userModel.value = null;
    Logger().wtf("Data is the userdata observable cleared");
  }
}
