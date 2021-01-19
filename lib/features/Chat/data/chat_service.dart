import 'package:newpostman1/features/Chat/data/chatModel.dart';
import 'package:newpostman1/models/user/UserModel.dart';

abstract class ChatService {
  Future sendMessage(String message, String receiverEmail, bool isImage);
  Stream<List<ChatModel>> get getMessages;
  Stream<List<UserModel>> get getUsers;
  //we have to get the users who have messaged with this user
  Stream<List<ChatModel>> get getChats;
}
