import 'package:newpostman1/features/send_package/data/PackageModel.dart';

abstract class RespondToEventsService {
  //this fucntion is to respond to the request of the client when the client select a postman
  Future<void> cancelRequest(String docId);

  Future<void> respondToTheRequestOfClient(
      int responseType, String requestDocId);

//this will fetch the details about the package
  Future<PackageModel> getPackageDetails(String docId);
}
