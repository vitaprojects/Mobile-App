import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_helpers/firestore_helpers.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/MyPackages/domain/posted_packages_service.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';

class PostedPackagesServiceImpl extends PostedPackagesService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<List<FullPackageModel>> getAllPostedPackages() {
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
}
