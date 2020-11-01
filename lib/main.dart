import 'package:async/async.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/loading/presentation/LoadingPage.dart';
import 'package:newpostman1/features/welcome/presentation/WelcomeScreen.dart';
import 'package:newpostman1/ui/RootWidget.dart';
import 'useful/service_locator.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  FutureGroup futureGroup = FutureGroup();
  Future openBox = Hive.openBox('user');

  @override
  void initState() {
    futureGroup.add(_initialization);
    futureGroup.add(openBox);
    futureGroup.close();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        future: futureGroup.future,
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
            print("box opened");
            print("firebase project initialized");
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
