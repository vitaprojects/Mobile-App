import 'package:newpostman1/features/post_itinerary/data/Itinerary_model.dart';
import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';

abstract class FindAvailablePostmanForPackageService {
  Future<FullPackageModel> getInfoAboutLatestPackage();

  Stream<List<ItineraryModel>> getAvailablePostman(
      FullPackageModel packageModel);

  Future<void> sendRequestForPostman(
      FullPackageModel packageModel, String emailOfPostman);
}
