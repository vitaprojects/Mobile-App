import 'dart:io';

import 'package:newpostman1/features/post_itinerary/data/Itinerary_model.dart';

///This Service is used for the services of the [`Itinerary`]
abstract class ItenaryService {
  ///This function is used to [`post`] itineray details
  Future<void> postItinerary(ItineraryModel itenaryModel);

  ///This function is used to [`post`] itineray details if the travel type is [`plane`]

  Future<void> postFlightItinerary(
      ItineraryModel itenaryModel, File ticketFile);
}
