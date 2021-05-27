import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/models/user/UserModel.dart';

///This class is used to listen to the events such as [`new requests`] from users and [`new responses`] from postman
abstract class ListenToEventsService {
  //this function  is for the lsitening to messages and requests the  user receive
  Stream<List<RequestModel>> listenToNewRequestsForthePostman();

  void displayAlertForNewRequest();

  Stream<List<RequestModel>> listenToNewResponsesFromthePostman();

  void displayAlertForNewResponseFromPostman();

  ///This function is used to listen to [`all orders`] of the [`current postman`]

  Stream<List<OrderModel>> listentoAllOrdersOfthePostman();

  ///This function is used to listen to [`all orders`] of the [`current user`]

  Stream<List<OrderModel>> listentoAllOrdersOftheUser();

  ///This function is used to listen to [`all errands`] of the [`current postman`]

  Stream<List<OrderModel>> listentoAllErrandsOfthePostman();

  ///This function is used to listen to [`all errands`] of the [`current user`]

  Stream<List<OrderModel>> listentoAllErrandsOftheUser();

  Stream<UserModel> getUserModelAsAStream();

  ///This function is used to listen to all confirmed requests for the postman
  Stream<List<RequestModel>> listenToNewConfirmationsForthePostman();

  Future<void> changeRequestStatusWhenOrderStarted(RequestModel requestModel);
}
