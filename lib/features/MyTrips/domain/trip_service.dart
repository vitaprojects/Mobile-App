import 'package:newpostman1/features/post_itinerary/data/Itinerary_model.dart';

abstract class TripService {
  //this will fetch all the trips of the user depending on the type
  //if the type is 0 it will fetch all the pending trips
  //if the type is 1 it will fetch all completed trips
  Stream<List<ItineraryModel>> getAllTrips(int type);
}
