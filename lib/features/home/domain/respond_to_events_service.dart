abstract class RespondToEventsService {
  //this fucntion is to respond to the request of the client when the client select a postman
  Future<void> cancelRequest(String docId);

  Future<void> respondToTheRequestOfClient(
      int responseType, String requestDocId);
}
