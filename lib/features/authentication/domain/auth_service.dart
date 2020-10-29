import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationService {
  Future<void> signUpEmail(
      String email, String password, String userName, String phoneNumber);

  Future<User> getCurrentUser();

  Future<void> signIn(
    String email,
    String passWord,
  );

  // Future registerUser(String mobile, BuildContext context);

  Future<void> sendResetMail(String email);

  Future<void> signOut();

  Future<void> setDeviceTokenDuringLogin(String userEmail);

  Future<void> deleteDeviceTokenWhenLoggingOut(
      String userEmail,
      String
          deviceToken); //we have to remove this token from the user document in firebase

  goBackAfterSignUp();
}
