import 'dart:io';

import 'package:newpostman1/features/post_itinerary/data/travelTypes/TravelType.dart';

//TODO cannot add the tojson because this class has a field called file
//find a solution for it
class PlaneTravelType extends TravelType {
  File ticket;
  String flightNumber;
  String airLineName;
  PlaneTravelType({
    this.ticket,
    this.flightNumber,
    this.airLineName,
  });
}
