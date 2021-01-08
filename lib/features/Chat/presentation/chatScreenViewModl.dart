import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:newpostman1/features/Chat/data/chatModel.dart';
import 'package:newpostman1/features/Chat/data/chat_service.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

class ChatScreenViewModel extends StreamViewModel<List<ChatModel>> {
  final ChatService chatService = locator<ChatService>();
  List<ChatModel> get userChats => data;
  @override
  Stream<List<ChatModel>> get stream => chatService.getChats;

  
}
