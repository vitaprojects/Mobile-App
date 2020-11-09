import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/services/push_notification_service.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:newpostman1/features/home/presentation/HomePage.dart';
import 'package:newpostman1/useful/rootPage.dart';
import 'package:newpostman1/useful/service_locator.dart';

class AuthenticationServiceImplementation extends AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestoreDb = FirebaseFirestore.instance;
  PushNotificationService pushNotificationService =
      locator<PushNotificationService>();
  SnackBarService snackBarService = locator<SnackBarService>();

  @override
  Future<User> getCurrentUser() async {
    User user = _firebaseAuth.currentUser;
    return user;
  }

  @override
  Future<void> sendResetMail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
        snackBarService.showSnackBar("Password reset email sent",
            "Please check your email to reset your email", false);
      });
    } on FirebaseAuthException catch (e) {
      snackBarService.showSnackBar("Error occured", e.message, true);
    } on PlatformException catch (e) {
      snackBarService.showSnackBar("Error occured", e.message, true);
    } catch (e) {
      snackBarService.showSnackBar("Error occured", e.toString(), true);
    }
  }

  @override
  Future<void> signIn(String email, String passWord) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.toLowerCase(), password: passWord);
      User user = result.user;
      if (user != null) {
        // if (user.pho) {}
        //Check whether the user verifed the email
        if (user.emailVerified) {
          await firestoreDb
              .collection("users")
              .doc(user.email.trim().toLowerCase())
              .get()
              .then((value) {
            if (value.exists) {
              Hive.box('user')
                  .put('uname',
                      value.data()['fname'] + " " + value.data()['lname'])
                  .then((value) {
                print("user data added to the box successfully");
              }).catchError((onError) {
                print(onError.toString());
              });

              setDeviceTokenDuringLogin(user.email);

              Hive.box("user")
                  .put("email", user.email.toLowerCase().trim())
                  .catchError((onError) {
                print(onError);
              }).then((value) {
                Get.offAll(HomePage());
                snackBarService.showSnackBar(
                    "Success", "You have successfully logged in", false);
              });
            } else {
              snackBarService.goBackAfterTimePeriod(
                  "Error occured", "Please try again", true);

              _firebaseAuth.signOut();
            }
          }).catchError((onError) {
            // print(onError);
            snackBarService.goBackAfterTimePeriod(
                "Error occured", "Please try again", true);

            _firebaseAuth.signOut();
          });
        } else {
          // Get.back();
          result.user.sendEmailVerification().catchError((onError) {
            // Future.delayed(Duration(seconds: 2)).then((value) {
            //   Get.snackbar(
            //     "Error occured",
            //     onError.toString(),
            //     icon: Icon(
            //       Icons.error,
            //       color: Colors.red,
            //     ),
            //     backgroundColor: Colors.white,
            //   );
            // });
            snackBarService.goBackAfterTimePeriod(
                "Error occured", onError, true);

            // _firebaseAuth.signOut();
          }).then((value) {
            print("verification email sent successfully");
          });

          Get.back();

          _firebaseAuth.signOut();

          Future.delayed(Duration(seconds: 2)).then((value) {
            Get.snackbar(
              "Email not verified",
              "Please verify your email address",
              icon: Icon(
                Icons.error,
                color: Colors.red,
              ),
              backgroundColor: Colors.white,
            );
          });
        }
      } else {
        snackBarService.goBackAfterTimePeriod(
            "Error occured", "Please try again", true);
      }
    } on PlatformException catch (e) {
      snackBarService.goBackAfterTimePeriod("Error occured", e.message, true);
    } on FirebaseAuthException catch (e) {
      snackBarService.goBackAfterTimePeriod("Error occured", e.message, true);
    } catch (e) {
      snackBarService.goBackAfterTimePeriod(
          "Error occured", e.toString(), true);
    }
  }

  @override
  Future<void> signOut() async {
    print('signout function');
    try {
      deleteDeviceTokenWhenLoggingOut(
          Hive.box("user").get('email'), Hive.box('user').get('deviceID'));

      await Hive.box("user").clear().catchError((value) {}).then((value) {
        print("data inside box cleared");
      });
      await _firebaseAuth.signOut();

      // reset();

      // setupServiceLocator();

      Get.offAll(RootPage());
      // runApp(MyApp());
      // Phoenix.rebirth(context);
    } catch (e) {
      print(e);
      print('inside signout error');
    }
  }

  @override
  Future<void> signUpEmail(UserModel userModel, String password) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy.MM.dd').format(now);

    try {
      UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: userModel.email.trim().toLowerCase(),
              password: password.trim());
      if (result.user != null) {
        await firestoreDb
            .collection("users")
            .doc(userModel.email.toLowerCase().trim())
            .set(userModel.toJson())
            .then((value) {
          result.user.sendEmailVerification();

          firestoreDb.collection("dates").doc(formattedDate).set({
            'new_user_count': FieldValue.increment(1),
          }, SetOptions(merge: true)).catchError((onError) {
            print(onError);
          });
          firestoreDb.collection("data").doc("userData").set({
            'user_count': FieldValue.increment(1),
          }, SetOptions(merge: true)).catchError((onError) {
            print(onError);
          });

          snackBarService.goBackAfterTimePeriod(
              "Success",
              "New account created successfully,Please verify your email to continue",
              false);
          _firebaseAuth.signOut();
        }).catchError((onError) {
          _firebaseAuth.signOut();

          snackBarService.goBackAfterTimePeriod(
              "Error Occured", onError.toString(), true);
        });
      }
    } on FirebaseAuthException catch (e) {
      snackBarService.goBackAfterTimePeriod("Error occured", e.message, true);
    } on PlatformException catch (e) {
      snackBarService.goBackAfterTimePeriod("Error occured", e.message, true);
    } catch (e) {
      snackBarService.goBackAfterTimePeriod(
          "Error occured", e.toString(), true);
    }
  }

  @override
  goBackAfterSignUp() {
    Get.back();
  }

  @override
  Future<void> setDeviceTokenDuringLogin(String userEmail) async {
    try {
      String fcmToken = await pushNotificationService.getFCMToken();

//Add the new device id to firebase
      await firestoreDb
          .collection("users")
          .doc(userEmail.toLowerCase().trim())
          .update({
        'deviceIds': FieldValue.arrayUnion([fcmToken])
      }).catchError((onError) {
        print(onError);
      });

      //store the device id in hive
      //so we can remove it when the user logout from the sytem
      //TODO what will happen if the user cleared the data in the app .please figure it out

      Hive.box('user').put('deviceID', fcmToken).catchError((onError) {
        print(onError);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> deleteDeviceTokenWhenLoggingOut(
      String userEmail, String deviceToken) async {
    await firestoreDb
        .collection("users")
        .doc(userEmail.toLowerCase().trim())
        .update({
      'deviceIds': FieldValue.arrayRemove([deviceToken])
    }).catchError((onError) {
      print(onError);
    }).then((value) {
      print("device token deleted");
    });
  }

  // @override
  // Future registerUser(String mobile, BuildContext context) async {
  //   _firebaseAuth.verifyPhoneNumber(
  //       phoneNumber: mobile,
  //       timeout: Duration(
  //         seconds: 60,
  //       ),
  //       verificationCompleted: (AuthCredential authCredential) {
  //         _firebaseAuth
  //             .signInWithCredential(authCredential)
  //             .then((AuthResult result) {
  //           if (result.user != null) {
  //             Get.to(HomePage());
  //           }
  //         }).catchError((e) {
  //           print(e);
  //         });
  //       },
  //       verificationFailed: (AuthException authException) {
  //         print(authException.message);
  //         Get.snackbar(
  //           "Error",
  //           authException.message,
  //           icon: Icon(
  //             Icons.error,
  //             color: Colors.red,
  //           ),
  //           backgroundColor: Colors.white,
  //         );
  //       },
  //       codeSent: (String verificationId, [int forceResendingToken]) {
  //         //show dialog to take input from the user
  //         Get.to(VerificationPage(
  //           verificationId: verificationId,
  //         ));
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         verificationId = verificationId;
  //         print(verificationId);
  //         print("Timout");
  //       });
  // }
}
