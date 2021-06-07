import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_helpers/firestore_helpers.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/features/home/domain/respond_to_events_service.dart';
import 'package:newpostman1/features/home/presentation/ViewCustomerRequestForErrand/CustomerRequestForErrandView.dart';
import 'package:newpostman1/features/home/presentation/ViewCustomerRequestForPackage/CustomerRequestForPackageView.dart';
import 'package:newpostman1/features/payment/presentation/pages/PaymentPageView.dart';
import 'package:newpostman1/models/user/UserModel.dart';
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
      // Query query = buildQuery(
      //     collection: firebaseFirestore.collection('requests'),
      //     constraints: [
      //       QueryConstraint(
      //         field: 'postman',
      //         isEqualTo: Hive.box('user').get('email'),
      //       ),
      //       QueryConstraint(
      //         field: 'hasSeenbyPostman',
      //         isEqualTo: false,
      //       ),
      //       QueryConstraint(
      //         field: 'status',
      //         isEqualTo: 0,
      //       ),
      //     ],
      //     orderBy: [
      //       OrderConstraint(
      //         'date',
      //         true,
      //       )
      //     ]);
      // return getDataFromQuery(
      //   query: query,
      //   mapper: (requestDoc) {
      //     var request = RequestModel.fromJson(requestDoc.data());
      //     request.requestId = requestDoc.id;
      //     return request;
      //   },
      //   // clientSidefilters: (event) =>
      //   //     event.startTime > DateTime.now() // only future events
      //   // orderComparer: (event1, event2) => event1.name.compareTo(event2.name)
      // );
      //

      Logger().i(
          "The email in listen to new requests for the postman:${Hive.box('user').get('email')} ");
      return firebaseFirestore
          .collection("requests")
          .where("postman", isEqualTo: Hive.box('user').get('email'))
          .where("hasSeenbyPostman", isEqualTo: false)
          .where("status", isEqualTo: 0)
          .orderBy('date', descending: true)
          .snapshots()
          .map((event) {
        return event.docs
            .map((e) => RequestModel.fromJson(e.data()))
            .toList()
            .where((element) => element.user != Hive.box('user').get('email'))
            .toList();
      });
    } on Exception catch (ex) {
      print(ex);
    }
    return null;
  }

  @override
  void displayAlertForNewRequest() async {
    print('display alert');

    listenToNewRequestsForthePostman().listen((event) async {
      if (event.length != 0) {
        RequestModel requestModel = event.first;
        var response = await dialogService.showConfirmationDialog(
          //TODO get all responses for dialogs like this
          // variant: DialogType.form,
          title: 'You received a new request',
          description: 'You received a new request from ${requestModel.user}',
          // mainButtonTitle: 'Confirm',
          confirmationTitle: "view".toUpperCase(),
          cancelTitle: "cancel".toUpperCase(),
        );

        if (response != null && response.confirmed) {
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
            Get.to(CustomerRequestForErrandView(
              requestModel: requestModel,
            ));
          }
        } else {
          print("user rejected");

          respondToEventsService.cancelRequest(requestModel.requestId);
        }
      }
    });
  }

  @override
  Stream<List<RequestModel>> listenToNewResponsesFromthePostman() {
    try {
      // Query query = buildQuery(
      //     collection: firebaseFirestore.collection('requests'),
      //     constraints: [
      //       QueryConstraint(
      //         field: 'user',
      //         isEqualTo: Hive.box('user').get('email'), //the users email
      //       ),
      //       QueryConstraint(
      //         field: 'hasSeenbyPostman', //postman should see the request
      //         isEqualTo: true,
      //       ),
      //       QueryConstraint(
      //         field:
      //             'hasSeenbyUser', //user should nt see the request because this is a new request
      //         isEqualTo: false,
      //       ),
      //       QueryConstraint(
      //         field: 'status', //status should be 1 when the postman accepts it
      //         isEqualTo: 1,
      //       ),
      //     ],
      //     orderBy: [
      //       OrderConstraint(
      //         'date',
      //         true,
      //       )
      //     ]);
      // return getDataFromQuery(
      //   query: query,
      //   mapper: (requestDoc) {
      //     var request = RequestModel.fromJson(requestDoc.data());
      //     request.requestId = requestDoc.id;
      //     return request;
      //   },
      //   // clientSidefilters: (event) =>
      //   //     event.startTime > DateTime.now() // only future events
      //   // orderComparer: (event1, event2) => event1.name.compareTo(event2.name)
      // );
      return firebaseFirestore
          .collection("requests")
          .where("user", isEqualTo: Hive.box('user').get('email'))
          .where("hasSeenbyPostman", isEqualTo: true)
          .where("hasSeenbyUser", isEqualTo: false)
          .where("status", isEqualTo: 1)
          .orderBy('date', descending: true)
          .snapshots()
          .map((event) {
        return event.docs.map((e) => RequestModel.fromJson(e.data())).toList();
      });
    } on Exception catch (ex) {
      print(ex);
    }
    return null;
  }

  @override
  void displayAlertForNewResponseFromPostman() async {
    print("display alert for postman");
    listenToNewResponsesFromthePostman().listen((event) async {
      if (event.length != 0) {
        RequestModel requestModel = event.first;
        if (requestModel.type == 0) {
          //this is a response to a pacakge request from the client
          DialogResponse response = await dialogService.showConfirmationDialog(
            // variant: DialogType.form,
            title: 'You received a new offer',
            description:
                'You received a new offer from ${requestModel.postman} with an offer of ${requestModel.postmanOffer}',

            // mainButtonTitle: 'Confirm',
            confirmationTitle: "accept".toUpperCase(),
            cancelTitle: "reject".toUpperCase(),
          );
          if (response != null && response.confirmed) {
            print("user accepted the offer");
            // respondToEventsService.respondTotheOfferOfPostman(
            //     true, requestModel);
            Get.to(PaymentPageView(
              requestModel: requestModel,
            ));
          } else {
            print("user rejected");
            respondToEventsService.respondTotheOfferOfPostman(
                false, requestModel);
          }
        } else {
          //this is a repsonse to a errand request from the client
          dialogService
              .showConfirmationDialog(
            // variant: DialogType.form,
            title: 'Your errand request accepeted',
            description:
                'You errand request accepeted by ${requestModel.postman}',

            // mainButtonTitle: 'Confirm',
            confirmationTitle: "ok".toUpperCase(),
            // cancelTitle: "reject".toUpperCase(),
          )
              .then((value) {
            if (value != null && value.confirmed) {
              print("user accepted the offer");
              // respondToEventsService.respondTotheOfferOfPostman(
              //     true, requestModel);
              Get.to(PaymentPageView());
              //TODO ask from clinet how the user is paying for the
              //we will start the order here

              //TODO add this order creation to the right place

              OrderModel orderModel = OrderModel(
                postmanFee:
                    null, //we dont any info about these they are in the errand document
                pacakgeDocId: requestModel.packageDocID,
                postmanEmail: requestModel.postman,
                statusOftheOrder:
                    0, //in the beggining of te order the status is 0
                tipAmount: 0, //in the begniing we are not paying the tip
                type: 1, //because this is a order of a errand
                userEmail: Hive.box('user').get('email').toLowerCase(),
              );

              firebaseFirestore.collection('orders').add(orderModel.toJson());
            } else {
              //the user cannot cancel this
            }
          });
        }
      } else {
        print("no new requests from postman");
      }
    });
  }

  @override
  Stream<List<OrderModel>> listentoAllErrandsOfthePostman() {}

  @override
  Stream<List<OrderModel>> listentoAllErrandsOftheUser() {}

  @override
  Stream<List<OrderModel>> listentoAllOngoingOrdersOfthePostman() {
    return firebaseFirestore
        .collection("orders")
        .where("postmanEmail", isEqualTo: Hive.box('user').get('email'))
        .where("statusOftheOrder", isEqualTo: 0)
        .snapshots()
        .map((event) => event.docs.isEmpty
            ? []
            : event.docs.map((e) => OrderModel.fromJson(e.data())).toList());
  }

  @override
  Stream<List<OrderModel>> listentoAllOrdersOftheUser() {
    return firebaseFirestore
        .collection("orders")
        .where("userEmail", isEqualTo: Hive.box('user').get('email'))
        .snapshots()
        .map((event) => event.docs.isEmpty
            ? []
            : event.docs.map((e) => OrderModel.fromJson(e.data())).toList());
  }

  @override
  Stream<UserModel> getUserModelAsAStream() {
    return firebaseFirestore
        .collection("users")
        .doc(Hive.box('user').get('email'))
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()));
  }

  @override
  Stream<List<RequestModel>> listenToNewConfirmationsForthePostman() {
    return firebaseFirestore
        .collection("requests")
        .where("postman", isEqualTo: Hive.box('user').get('email'))
        .where("hasSeenbyPostman", isEqualTo: false)
        .where("hasSeenbyUser", isEqualTo: true)
        .where("status", isEqualTo: 2)
        .orderBy('date', descending: true)
        .snapshots()
        .map((event) {
      return event.docs.map((e) => RequestModel.fromJson(e.data())).toList();
    });
  }

  @override
  Future<void> changeRequestStatusWhenOrderStarted(
      RequestModel requestModel) async {
    await firebaseFirestore
        .collection("requests")
        .doc(requestModel.requestId)
        .update({
      "status": 3,
      "hasSeenbyPostman": true,
    });

    await firebaseFirestore
        .collection("users")
        .doc(requestModel.postman)
        .update({
      'activeJobs': FieldValue.increment(1),
    });
  }
}
