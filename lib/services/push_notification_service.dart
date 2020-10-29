import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
// import 'package:peckme/views/NoficationsView.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      //called when the app is in the foreground and we recceive a notifiaction
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _serialiseAndNavigate(message);
      },
      //called when the app is closed completely

      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _serialiseAndNavigate(message);
      },

      //app is in the backgounnd and we open the app using the push notification
      onResume: (Map<String, dynamic> message) async {
        _serialiseAndNavigate(message);

        print("onResume: $message");
      },
    );
  }

  Future<String> getFCMToken() async {
    return _fcm.getToken();
  }

  void _serialiseAndNavigate(Map<String, dynamic> message) {
    //TODO here we have to make sure the user navigate to either the emergency page or the notitfiaction page
    //TODO add push notification to ios version
    var notificationData = message['data'];
    var view = notificationData['view'];
    print("inside serialize and navigate");
    print(view);

    if (view != null) {
      // Navigate to the create post view
      if (view == 'notification_view') {
        print("go to notification view");
        //TODO fix this
        // Get.to(MiddleWidget());
      } else if (view == 'post_view') {
        // Get.to(MiddleWidget());

        // Get.offAll(roo)
        //here we dont have to direct the user to anywhere else we because the post in in the home page of the app
      }
      // If there's no view it'll just open the app on the first view
    }
  }
}
