import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
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

    ///* [`Transaction`] is used first to determine if there is a record already exists
    ///[`dont`] change the postion of getters and setters in transcation
    ///[`getters`] should be called first
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

  ///* make sure you dont change this because this just returns all the users which are in  the app and later use it
  ///for querying !
  ///! using the list to query is faster than using the firestore querying

  @override
  Stream<List<UserModel>> get getUsers => FirebaseFirestore.instance
      .collection('users')
      .doc(Hive.box('user').get('email'))
      .collection('chats')
      .snapshots()
      .map(_listOfusers);

  List<UserModel> _listOfusers(QuerySnapshot querySnapshot) =>
      querySnapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
  // .docs
  // .map((doc) => UserModel(
  //     activeJobs: doc.data()['activeJobs'],
  //     completedJobs: doc.data()['completedJobs'],
  //     // deviceIds: doc.data()['deviceIds'] as List<String>,
  //     email: doc.data()['email'],
  //     fname: doc.data()['fname'],
  //     lname: doc.data()['lname'],
  //     phone: doc.data()['phone'],
  //     rejectedJobs: doc.data()['rejectedJobs'],
  //     totalEarnings: double.parse(doc.data()['totalEarnings'].toString()))
  //     )
  // .toList();

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
