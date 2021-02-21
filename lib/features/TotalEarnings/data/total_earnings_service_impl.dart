import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:newpostman1/features/TotalEarnings/data/total_earnings_service.dart';
import 'package:newpostman1/models/earningsModel.dart';

class TotalEarningsServiceImpl implements TotalEarningsService {
  final CollectionReference collectionReference = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.email)
      .collection('Data');

  @override
  Stream<EarningsModel> get getMonthEarnings => collectionReference
      .doc(DateFormat('yyyy.MM').format(DateTime.now()))
      .snapshots()
      .map(_userEarningss);

  EarningsModel _userEarningss(DocumentSnapshot e) {
    return EarningsModel(
        totalEarnings: double.parse(e.data()['totalEarnings'].toString()),
        commpletedJobs: e.data()['commpletedJobs'],
        date: e.data()['date'],
        ongoingJobs: e.data()['ongoingJobs'],
        pendingJobs: e.data()['pendingJobs'],
        cancelledJobs: e.data()['cancelledJobs']);
  }

  @override
  Stream<EarningsModel> get getAllEarnings => FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.email)
      .snapshots()
      .map(_userSnaps);

  @override
  Stream<EarningsModel> get getDayEarnings => collectionReference
      .doc(DateFormat('yyyy.MM').format(DateTime.now()))
      .collection('days')
      .doc(DateFormat('yyyy.MM.dd').format(DateTime.now()))
      .snapshots()
      .map(_userEarningss);

  EarningsModel _userSnaps(DocumentSnapshot e) {
    return EarningsModel(
        cancelledJobs: e.data()['rejectedJobs'],
        commpletedJobs: e.data()['completedJobs'],
        ongoingJobs: e.data()['activeJobs'],
        totalEarnings: double.parse(e.data()['totalEarnings'].toString()));
  }
}
