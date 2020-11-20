import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_helpers/firestore_helpers.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/find_postman/data/RequestModel.dart';
import 'package:newpostman1/features/home/domain/respond_to_events_service.dart';
import 'package:newpostman1/features/home/presentation/ViewCustomerRequestForErrand/CustomerRequestForErrandView.dart';
import 'package:newpostman1/features/home/presentation/ViewCustomerRequestForPackage/CustomerRequestForPackageView.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked_services/stacked_services.dart';

import 'listen_to_events_service.dart';

class ListenToEventsServiceImpl extends ListenToEventsService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final DialogService dialogService = locator<DialogService>();
  final RespondToEventsService respondToEventsService =
      locator<RespondToEventsService>();
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
            QueryConstraint(
              field: 'status',
              isEqualTo: 0,
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
          confirmationTitle: "view".toUpperCase(),
          cancelTitle: "cancel".toUpperCase(),
        )
            .then((value) {
          if (value != null && value.confirmed) {
            print("user accepted");

            //now we have to load the ui depending on the type of the package
            //if the request is for a package we have to load the viewcustomerRequest for package
            //othwerwise we have to load the viewcustomerReuqest For errand

            if (requestModel.type == 0) {
              //this is a package request
              Get.to(CustomerRequestForPackageView(
                requestModel: requestModel,
              ));
            } else {
              Get.to(CustomerRequestForErrandView());
            }
          } else {
            print("user rejected");

            respondToEventsService.cancelRequest(requestModel.requestId);
          }
        });
      }
    });
  }

  @override
  Stream<List<RequestModel>> listenToNewResponsesFromthePostman() {
    try {
      Query query = buildQuery(
          collection: firebaseFirestore.collection('requests'),
          constraints: [
            QueryConstraint(
              field: 'user',
              isEqualTo: Hive.box('user').get('email'), //the users email
            ),
            QueryConstraint(
              field: 'hasSeenbyPostman', //postman should see the request
              isEqualTo: true,
            ),
            QueryConstraint(
              field:
                  'hasSeenbyUser', //user should nt see the request because this is a new request
              isEqualTo: false,
            ),
            QueryConstraint(
              field: 'status', //status should be 1 when the postman accepts it
              isEqualTo: 1,
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
  void displayAlertForNewResponseFromPostman() async {
    print("display alert for postman");
    listenToNewResponsesFromthePostman().listen((event) {
      if (event.length != 0) {
        RequestModel requestModel = event.first;
        dialogService
            .showConfirmationDialog(
          // variant: DialogType.form,
          title: 'You received a new offer',
          description:
              'You received a new offer from ${requestModel.postman} with an offer of ${requestModel.postmanOffer}',

          // mainButtonTitle: 'Confirm',
          confirmationTitle: "accept".toUpperCase(),
          cancelTitle: "reject".toUpperCase(),
        )
            .then((value) {
          if (value != null && value.confirmed) {
            print("user accepted the offer");
          } else {
            print("user rejected");
          }
        });
      } else {
        print("no new requests");
      }
    });
  }
}
