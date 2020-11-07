import 'dart:io';

import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';

abstract class ItenaryService {
  Future<void> postItenary(ItenaryModel itenaryModel);

  Future<void> postFlightItenary(ItenaryModel itenaryModel, File ticketFile);
}
