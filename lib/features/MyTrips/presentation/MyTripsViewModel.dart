import 'package:flutter/widgets.dart';
import 'package:newpostman1/features/MyTrips/domain/trip_service.dart';
import 'package:newpostman1/useful/service_locator.dart';

class MyTripsViewModel extends ChangeNotifier {
  final TripService tripService = locator<TripService>();
}
