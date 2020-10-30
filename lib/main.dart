import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpostman1/features/loading/presentation/LoadingPage.dart';
import 'package:newpostman1/features/welcome/presentation/WelcomeScreen.dart';
import 'package:newpostman1/ui/RootWidget.dart';
import 'useful/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //TODO add a futureGroup to combine 2 fututres
      home: FutureBuilder(
        future: _initialization,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return SafeArea(
              child: Scaffold(
                body: Center(
                  child: Text(snapshot.error),
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return RootWidget(
              child: WelcomeScreen(),
            );
          } else {
            return RootWidget(
              child: LoadingPage(
                text: "Loading",
              ),
            );
          }
        },
      ),
    );
  }
}
