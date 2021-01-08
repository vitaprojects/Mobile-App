import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:newpostman1/features/Chat/data/chatModel.dart';
import 'package:newpostman1/features/Chat/data/chat_service.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

class ChatMessagesBuilderViewmodel extends StreamViewModel<List<ChatModel>> {
  final chatservice = locator<ChatService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();
      
  // User user=  authenticationService.getCurrentUser();
  ScrollController scrollController;
  final GlobalKey<DashChatState> chatViewKey = GlobalKey<DashChatState>();

  User get user => FirebaseAuth.instance.currentUser;

  // double get getScrollExtern => scrollController.position.maxScrollExtent;

  List<ChatModel> get listModels => data;

  

  @override
  Stream<List<ChatModel>> get stream => chatservice.getMessages;

  @override
  void initialise() {
    // scrollController = ScrollController();
    super.initialise();
  }
}
