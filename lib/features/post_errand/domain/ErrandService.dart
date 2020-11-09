import 'dart:io';

import 'package:newpostman1/features/post_errand/data/PostErrandModel.dart';

abstract class ErrandService {
  Future<void> postAvailablityForErrand();

  Future<void> uploadImagesOftheErrand(
      List<File> images, PostErrandModel postErrandModel);

  Future<void> postErrand(PostErrandModel postErrandModel);
}
