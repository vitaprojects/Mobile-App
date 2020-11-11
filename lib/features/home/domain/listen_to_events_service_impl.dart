import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_helpers/firestore_helpers.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/find_postman/data/RequestModel.dart';
import 'package:newpostman1/features/find_postman/presentation/AvailablePostmanViewModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked_services/stacked_services.dart';

import 'listen_to_events_service.dart';

class ListenToEventsServiceImpl extends ListenToEventsService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final DialogService dialogService = locator<DialogService>();
  @override
  Stream<List<RequestModel>> listenToNewRequestsForthePostman() {
    try {
      Query query = buildQuery(
          collection: firebaseFirestore.collection('requests'),
          constraints: [
            QueryConstraint(
              field: 'postman',
              isEqualTo: Hive.box('user').get('email'),
            ),
            QueryConstraint(
              field: 'hasSeenbyPostman',
              isEqualTo: false,
            ),
          ],
          orderBy: [
            OrderConstraint(
              'date',
              true,
            )
          ]);
      return getDataFromQuery(
        query: query,
        mapper: (requestDoc) {
          var request = RequestModel.fromJson(requestDoc.data());
          request.requestId = requestDoc.id;
          return request;
        },
        // clientSidefilters: (event) =>
        //     event.startTime > DateTime.now() // only future events
        // orderComparer: (event1, event2) => event1.name.compareTo(event2.name)
      );
    } on Exception catch (ex) {
      print(ex);
    }
    return null;
  }

  @override
  void displayAlertForNewRequest() async {
    print('display alert');

    listenToNewRequestsForthePostman().listen((event) {
      if (event.length != 0) {
        RequestModel requestModel = event.first;
        dialogService
            .showConfirmationDialog(
          // variant: DialogType.form,
          title: 'You received a new request',
          description: 'You received a new request from ${requestModel.user}',
          // mainButtonTitle: 'Confirm',
        )
            .then((value) {
          if (value.confirmed) {
            print("user accepted");
          } else {
            print("user rejected");
          }
        });
      }
    });
  }
}
