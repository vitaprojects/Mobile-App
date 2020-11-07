import 'package:newpostman1/features/post_itenary/data/ItenaryModel.dart';

abstract class ItenaryService {
  Future<void> postItenary(ItenaryModel itenaryModel);
}
