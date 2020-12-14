import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:newpostman1/features/Check%20Internet%20connection/ConnectionStatusSingleton.dart';

class ConnectionStatusSingletonImpl extends ConnectionStatusSingleton {
  //we use connectivity to listen to network changes

  final Connectivity _connectivity = Connectivity();
  bool hasConnection = false;

  //streamcontroller created to listen to connection change
  StreamController connectionChangeController =
      new StreamController.broadcast();

  @override
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
        print("no connection");
      }
    } on SocketException catch (_) {
      hasConnection = false;
      print("no connection");
    }

    //The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }

  @override
  connectionChange() {
    // TODO: implement connectionChange
    throw UnimplementedError();
  }

  @override
  dispose() {
    connectionChangeController.close();
  }

  @override
  initialize() {
    _connectivity.onConnectivityChanged.listen((event) {
      print("listening to connection");
      checkConnection();
    });
  }

  // @override
  // getInstance() {
  //   // TODO: implement getInstance
  //   throw UnimplementedError();
  // }
}
