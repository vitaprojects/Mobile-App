import 'package:newpostman1/features/send_package/data/PackageModel.dart';

enum SendPackageEventType { addDataFromForm1, addDataFromForm2 }

class SendPackageEvent {
  PackageModel packageModel;
  SendPackageEventType eventType;

  SendPackageEvent();

  SendPackageEvent.addForm1Data(PackageModel packageModel) {
    this.packageModel = packageModel;
    this.eventType = SendPackageEventType.addDataFromForm1;
  }

  SendPackageEvent.addForm2Data(PackageModel packageModel) {
    this.packageModel = packageModel;
    this.eventType = SendPackageEventType.addDataFromForm2;
  }
}
