import 'package:newpostman1/features/Chat/data/chat_service.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

class AddNewChatViewmodel extends StreamViewModel<List<UserModel>> {
  List<UserModel> get userList => data;
  final chatservice = locator<ChatService>();

  void isOk() {
    chatservice.getUsers.forEach((element) {
      element.forEach((element) {
        print(element.email);
      });
    });
  }

  @override
  Stream<List<UserModel>> get stream => chatservice.getUsers;

  UserModel searchuser(String email) {
    UserModel userModel;
    if (userList != null) {
      userList.forEach((element) {
        if (element.email == email) userModel = element;
      });
    }

    return userModel;
  }
}
