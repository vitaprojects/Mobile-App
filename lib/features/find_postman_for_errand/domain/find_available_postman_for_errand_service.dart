import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';
import 'package:newpostman1/features/post_errand/data/RunErrandModel.dart';
import 'package:newpostman1/features/post_itinerary/data/Itinerary_model.dart';

abstract class FindAvailablePostmanForErrandService {
  Future<PostErrandModel> getInfoAboutLatestErrand();

  Stream<List<RunErrandModel>> getAvailablePostman(
      PostErrandModel postErrandModel);

  Future<void> sendRequestForPostman(
      PostErrandModel postErrandModel, String emailOfPostman);
}
