import 'package:firebase_auth/firebase_auth.dart';
import 'package:newpostman1/models/user/UserModel.dart';

///This service is used to handle all the [`authention`] functions in the app
abstract class AuthenticationService {
  ///[`Signup`] function
  Future<void> signUpEmail(UserModel userModel, String password);

  ///Return the current [`user`]

  Future<User> getCurrentUser();

  ///[`Sign in`] function

  Future<void> signIn(
    String email,
    String passWord,
  );

  ///This is used to send the password [`reset`] email
  Future<void> sendResetMail(String email);

  ///This is the [`signout`] function

  Future<void> signOut();

  ///This is used to save the [`device token`] in [`remote db`] during login

  Future<void> setDeviceTokenDuringLogin(String userEmail);

  ///This is used to [`delete`] the [`device token`] when the user logs out

  Future<void> deleteDeviceTokenWhenLoggingOut(
      String userEmail,
      String
          deviceToken); //we have to remove this token from the user document in firebase

  goBackAfterSignUp();
}
