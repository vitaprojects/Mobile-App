import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_helpers/firestore_helpers.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/MyPackages/domain/posted_packages_service.dart';
import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';

class PostedPackagesServiceImpl extends PostedPackagesService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<List<FullPackageModel>> getAllPostedPackages() {
    //TODO when getting all the posted packages of the user we have to fitlter only the available ones which means the status is 0
    try {
      // print(Hive.box('user').get('email'));
      Query query = buildQuery(
        collection: firebaseFirestore.collection('packages'),
        constraints: [
          QueryConstraint(
              field: 'postedBy', isEqualTo: Hive.box('user').get('email')),
          // QueryConstraint(
          //   field: 'departureDate',
          //   isGreaterThanOrEqualTo: date,
          // ),
        ],
        orderBy: [
          OrderConstraint('datePosted', true),
        ],
      );
      return getDataFromQuery(
        query: query,
        mapper: (packageDoc) {
          var package = FullPackageModel.fromJson(packageDoc.data());
          package.docId = packageDoc.id;
          // print(package);
          return package;
        },
        // clientSidefilters: [
        //   (ItenaryModel itenary) => (type == 0)
        //       ? now.isBefore(itenary.details.departureLocation.dateTime)
        //       : now.isAfter(itenary.details.departureLocation.dateTime)
        // ] // only future events
        // orderComparer: (event1, event2) => event1.name.compareTo(event2.name)
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Stream<List<FullPackageModel>> getAllAvailbePackages() {
    return firebaseFirestore
        .collection("packages")
        .where('postedBy', isEqualTo: Hive.box('user').get('email'))
        .where("status", isEqualTo: 0)
        .orderBy("datePosted", descending: true)
        .snapshots()
        .map((event) => event.docs
            .map((e) => FullPackageModel.fromJson(e.data()))
            .toList());
  }

  @override
  Stream<List<OrderModel>> getAllOngoingOrders() {
    return firebaseFirestore
        .collection("orders")
        .where("userEmail", isEqualTo: Hive.box("user").get("email"))
        .where("statusOftheOrder", isEqualTo: 0)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => OrderModel.fromJson(e.data())).toList());
  }
}
