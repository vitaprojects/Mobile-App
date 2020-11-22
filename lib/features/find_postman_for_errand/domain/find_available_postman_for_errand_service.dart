import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';
import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';

abstract class FindAvailablePostmanForErrandService {
  Future<PostErrandModel> getInfoAboutLatestErrand();

  Stream<List<ItenaryModel>> getAvailablePostman(
      PostErrandModel postErrandModel);

  Future<void> sendRequestForPostman(
      PostErrandModel postErrandModel, String emailOfPostman);
}
