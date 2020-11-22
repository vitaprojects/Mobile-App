import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';

abstract class PostedErrandsService {
  Stream<List<PostErrandModel>> getAllPostedErrands();
}
