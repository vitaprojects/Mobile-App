import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newpostman1/features/Chat/data/chatModel.dart';
import 'package:newpostman1/features/Chat/data/chat_service.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/models/user/UserModel.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:uuid/uuid.dart';

class ChatServiceImpl extends ChatService {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Chats');
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  ///* sending messages
  @override
  Future sendMessage(String mssage, String receiveremail, bool isImage) async {
    final String messageId = Uuid().v1();
    final User user = await authenticationService.getCurrentUser();

    await collectionReference.doc(messageId).set(ChatModel.message(
            createdAt: DateTime.now().toString(),
            message: mssage,
            messageId: messageId,
            senderEmail: user.email,
            isImage: isImage ?? false,
            receiveremail: receiveremail)
        .toMapMessage());
    // await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user.email)
    //     .collection('chats')
    //     .doc(receiveremail)
    //     .collection('messages')
    //     .doc(messageId)
    //     .set(ChatModel(messageid: messageId).toMap());

    // await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(receiveremail)
    //     .collection('chats')
    //     .doc(user.email)
    //     .collection('messages')
    //     .doc(messageId)
    //     .set(ChatModel(messageid: messageId).toMap());

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot documentSnapshot = await transaction.get(
          FirebaseFirestore.instance
              .collection('users')
              .doc(user.email)
              .collection('chats')
              .doc(receiveremail));
      DocumentSnapshot documentSnapshotq = await transaction.get(
          FirebaseFirestore.instance
              .collection('users')
              .doc(user.email)
              .collection('chats')
              .doc(user.email));

      if (!documentSnapshot.exists) {
        transaction.set(
            FirebaseFirestore.instance
                .collection('users')
                .doc(user.email)
                .collection('chats')
                .doc(receiveremail),
            ChatModel(messageid: messageId, email: receiveremail).toMap());
      }

      if (!documentSnapshotq.exists) {
        transaction.set(
            FirebaseFirestore.instance
                .collection('users')
                .doc(receiveremail)
                .collection('chats')
                .doc(user.email),
            ChatModel(messageid: messageId, email: user.email).toMap());
      }
    });
  }

  // Future _addMessageToUsers(String userId, String messageid) async {}

  @override
  Stream<List<ChatModel>> get getMessages => FirebaseFirestore.instance
      .collection('Chats')
      .orderBy('createdAt', descending: false)
      .snapshots()
      .map(_lisstFromSnapshots);

  List<ChatModel> _lisstFromSnapshots(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((e) => ChatModel.message(
            createdAt: e.data()['createdAt'],
            message: e.data()['message'],
            messageId: e.data()['messageId'],
            receiveremail: e.data()['receiveremail'],
            isImage: e.data()['isImage'] ?? false,
            senderEmail: e.data()['senderEmail']))
        .toList();
  }

  @override
  Stream<List<UserModel>> get getUsers => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map(_listOfusers);

  List<UserModel> _listOfusers(QuerySnapshot querySnapshot) =>
      querySnapshot.docs
          .map((doc) => UserModel(
              activeJobs: doc.data()['activeJobs'],
              completedJobs: doc.data()['completedJobs'],
              // deviceIds: doc.data()['deviceIds'] as List<String>,
              email: doc.data()['email'],
              fname: doc.data()['fname'],
              lname: doc.data()['lname'],
              phone: doc.data()['phone'],
              rejectedJobs: doc.data()['rejectedJobs'],
              totalEarnings: doc.data()['totalEarnings']))
          .toList();

  @override
  Stream<List<ChatModel>> get getChats => FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.email)
      .collection('chats')
      .snapshots()
      .map(_userChats);

  List<ChatModel> _userChats(QuerySnapshot snapshot) => snapshot.docs
      .map((e) =>
          ChatModel(email: e.data()['email'], messageid: e.data()['messageId']))
      .toList();
}