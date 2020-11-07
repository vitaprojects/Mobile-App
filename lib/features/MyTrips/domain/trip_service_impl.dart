import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_helpers/firestore_helpers.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:newpostman1/features/MyTrips/domain/trip_service.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';

class TripServiceImpl extends TripService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Stream<List<ItenaryModel>> getAllTrips(int type) {
    // try {
    //   if (type == 0) {
    //     print("get all pending trips");
    //        Query ref = buildQuery(
    //   collection: firebaseFirestore.collection('itineraries'),
    //   constraints: [
    //     QueryConstraint(field: 'email',isEqualTo: Hive.box('user').get('email')),
    //     // QueryConstraint()
    //   ], orderBy: [
    //       new OrderConstraint("startTime", false),
    //     ]);
    // return ref.snapshots().map((snapShot) => snapShot.docs.map(eventDoc) {
    //       var event = _eventSerializer.fromMap(eventDoc.data);
    //       event.id = eventDoc.documentID;
    //       return event;
    //     }).toList());
    //   } else {
    //     print("get all completed trips");
    //   }
    // } catch (e) {}
    DateTime now = new DateTime.now();
    // DateTime date = new DateTime(now.year, now.month, now.day);

    try {
      // print(Hive.box('user').get('email'));
      Query query = buildQuery(
          collection: firebaseFirestore.collection('itineraries'),
          constraints: [
            QueryConstraint(
                field: 'email', isEqualTo: Hive.box('user').get('email')),
            // QueryConstraint(
            //   field: 'departureDate',
            //   isGreaterThanOrEqualTo: date,
            // )
          ],
          orderBy: []);
      return getDataFromQuery(
          query: query,
          mapper: (itenaryDoc) {
            var itenary = ItenaryModel.fromJson(itenaryDoc.data()['data']);
            // event.id = eventDoc.documentID;
            // print(itenary.travelType);
            return itenary;
          },
          clientSidefilters: [
            (ItenaryModel itenary) =>
                now.isBefore(itenary.details.departureLocation.dateTime)
          ] // only future events
          // orderComparer: (event1, event2) => event1.name.compareTo(event2.name)
          );
    } catch (e) {
      print(e);
      return null;
    }
  }
}
