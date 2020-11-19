import 'package:newpostman1/features/find_postman/data/RequestModel.dart';

abstract class ListenToEventsService {
  //this class is for the lsitening to messages and requests the  user receive
  Stream<List<RequestModel>> listenToNewRequestsForthePostman();

  void displayAlertForNewRequest();

  Stream<List<RequestModel>> listenToNewResponsesFromthePostman();
}
