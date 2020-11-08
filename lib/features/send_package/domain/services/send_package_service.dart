import 'dart:ffi';
import 'dart:io';

import 'package:newpostman1/features/send_package/data/PackageModel.dart';

abstract class SendPackageService {
  Future<void> addDataAboutSendPackage(PackageModel packageModel);

  Future<void> uploadImagesOfthePackage(
      List<File> images, PackageModel packageModel);
}
