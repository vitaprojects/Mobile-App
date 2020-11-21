import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';

abstract class FindAvailablePostmanForPackageService {
  Future<FullPackageModel> getInfoAboutLatestPackage();

  Stream<List<ItenaryModel>> getAvailablePostman(FullPackageModel packageModel);

  Future<void> sendRequestForPostman(
      FullPackageModel packageModel, String emailOfPostman);
}
