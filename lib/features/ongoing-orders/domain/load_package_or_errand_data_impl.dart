import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';

import 'load_package_or_errand_data.dart';

class LoadPackageOrErrandDataImpl extends LoadPackageOrErrandData {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future loadPackageOrErrandDataWhenIdIsGiven(String docId, int type) async {
    if (type == 1) {
      DocumentSnapshot documentSnapshot =
          await firebaseFirestore.collection("packages").doc(docId).get();

      FullPackageModel fullPackageModel =
          FullPackageModel.fromJson(documentSnapshot.data());

      return fullPackageModel;
    } else {
      DocumentSnapshot documentSnapshot =
          await firebaseFirestore.collection("errands").doc(docId).get();

      PostErrandModel postErrandModel =
          PostErrandModel.fromJson(documentSnapshot.data());

      return postErrandModel;
    }
  }
}
