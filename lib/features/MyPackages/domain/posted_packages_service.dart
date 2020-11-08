import 'package:newpostman1/features/send_package/data/FullPackageModel.dart';

abstract class PostedPackagesService {
  Stream<List<FullPackageModel>> getAllPostedPackages();
}
