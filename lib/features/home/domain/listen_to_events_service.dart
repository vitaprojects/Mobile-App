import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';

///This class is used to listen to the events such as [`new requests`] from users and [`new responses`] from postman
abstract class ListenToEventsService {
  //this class is for the lsitening to messages and requests the  user receive
  Stream<List<RequestModel>> listenToNewRequestsForthePostman();

  void displayAlertForNewRequest();

  Stream<List<RequestModel>> listenToNewResponsesFromthePostman();

  void displayAlertForNewResponseFromPostman();
}
