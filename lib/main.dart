import 'package:async/async.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/Check%20Internet%20connection/ConnectionStatusSingleton.dart';
import 'package:newpostman1/features/loading/presentation/LoadingPage.dart';
import 'package:newpostman1/features/send_package/domain/bloc/SendPackageObserver.dart';
import 'package:newpostman1/ui/RootWidget.dart';
import 'package:newpostman1/useful/rootPage.dart';
import 'useful/service_locator.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  // print(DateFormat.yMMMd().format(DateTime.now()));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  Bloc.observer = SendPackageObserver();

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  setupServiceLocator();
  ConnectionStatusSingleton connectionStatusSingleton =
      locator<ConnectionStatusSingleton>();
  connectionStatusSingleton.initialize();
  // connectionStatusSingleton.
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ///separeate futures are created for firebase initialization and opening hive box
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  Future openBox = Hive.openBox('user');

  /// This is created to combine the above futures
  FutureGroup futureGroup = FutureGroup();

  @override
  void initState() {
    ///Adding the futures to the [`futureGroup`]
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
      home: FutureBuilder(
        ///in the [`FutureBuilder`] the future from the future group is used
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

            ///if the future is done we redirect the users to the root page
            return RootPage();
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
