import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_helpers/firestore_helpers.dart';
import 'package:hive/hive.dart';
import 'package:newpostman1/features/My%20errands/domain/posted_errands_service.dart';
import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';

class PostedErrandsServiceImpl extends PostedErrandsService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Stream<List<PostErrandModel>> getAllPostedErrands() {
    //TODO when getting all the posted packages of the user we have to fitlter only the available ones which means the status is 0

    try {
      // print(Hive.box('user').get('email'));
      Query query = buildQuery(
        collection: firebaseFirestore.collection('errands'),
        constraints: [
          QueryConstraint(
            field: 'userEmaill',
            isEqualTo: Hive.box('user').get('email'),
          ),
          QueryConstraint(
            field: 'type',
            isEqualTo: 1,
          ),
        ],
        orderBy: [
          OrderConstraint('datePosted', true),
        ],
      );
      return getDataFromQuery(
        query: query,
        mapper: (packageDoc) {
          var package = PostErrandModel.fromJson(packageDoc.data());
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
