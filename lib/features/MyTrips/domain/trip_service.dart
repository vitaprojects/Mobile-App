import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';

abstract class TripService {
  //this will fetch all the trips of the user depending on the type
  //if the type is 0 it will fetch all the pending trips
  //if the type is 1 it will fetch all completed trips
  Stream<List<ItenaryModel>> getAllTrips(int type);
}
