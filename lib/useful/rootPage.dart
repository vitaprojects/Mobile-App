import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/features/home/presentation/HomePage.dart';
import 'package:newpostman1/features/loading/presentation/LoadingPage.dart';
import 'package:newpostman1/features/welcome/presentation/WelcomeScreen.dart';
import 'package:newpostman1/services/push_notification_service.dart';
import 'package:newpostman1/ui/RootWidget.dart';
import 'package:newpostman1/useful/service_locator.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
  APP_NOT_UPDATED,
}

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";
  String email = "";
  AuthenticationService authenticationService =
      locator<AuthenticationService>();
  PushNotificationService pushNotificationService =
      locator<PushNotificationService>();

  String userEmailinHive = Hive.box('user').get('email');

  String projectVersion;
  String latestProjectVersion;
  bool hasUpdatedApp =
      true; //this is used to track whether the user has updated the app or not

  setupFCM() async {
    await pushNotificationService.initialise();
  }

  // getVersionCode() async {
  //   try {
  //     projectVersion = await GetVersion.projectVersion;
  //     print(projectVersion);
  //   } on PlatformException {
  //     projectVersion = 'Failed to get project version.';
  //   }
  // }

  // getLatestVersionCode() async {
  //   latestProjectVersion = await userService.getVerisionCodeOFLatestVersion();
  // }

  // check2versions() async {
  //   try {
  //     projectVersion = await GetVersion.projectVersion;
  //     print(projectVersion);
  //   } on PlatformException {
  //     projectVersion = 'Failed to get project version.';
  //   }

  //   latestProjectVersion = await userService.getVerisionCodeOFLatestVersion();

  //   if (latestProjectVersion != null && projectVersion != null) {
  //     if (latestProjectVersion.trim() == projectVersion.trim()) {
  //       print("this is the latest version");
  //       hasUpdatedApp = true;
  //     } else {
  //       setState(() {
  //         hasUpdatedApp = false;
  //         authStatus = AuthStatus.APP_NOT_UPDATED;
  //       });
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    setupFCM();
    // getVersionCode();
    // getLatestVersionCode();
    // check2versions();

    // FirebaseAuth.instance.authStateChanges().listen((event) {
    //   if (event == null) {
    //     print("user not logged in");
    //     authStatus = AuthStatus.NOT_LOGGED_IN;
    //   } else {
    //     print("user logged in");
    //     authStatus = AuthStatus.LOGGED_IN;
    //     //TODO add a splash screen before starting the app and listen to the auth change then when the event is avaible load the home page
    //   }
    // }).onData((data) {
    //   print(data);
    // });

    authenticationService.getCurrentUser().then((user) {
      if (user != null && userEmailinHive != null) {
        print("user logged in through email");
        setState(() {
          if (user != null) {
            _userId = user?.uid;
            email = user.email.toString();
          }
          authStatus = user?.uid == null
              ? AuthStatus.NOT_LOGGED_IN
              : AuthStatus.LOGGED_IN;
        });
      } else {
        print("user not logged in through e mail");
        setState(() {
          authStatus = AuthStatus.NOT_LOGGED_IN;
        });
      }
    });
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return RootWidget(child: WelcomeScreen());
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return RootWidget(child: WelcomeScreen());
        break;
      case AuthStatus.LOGGED_IN:
        return RootWidget(
          child: HomePage(),
        );

        break;

      // case AuthStatus.APP_NOT_UPDATED:
      //   return UpdateAppMessage();

      //   break;
      default:
        return RootWidget(child: LoadingPage(text: "Please wait"));
    }
  }
}
