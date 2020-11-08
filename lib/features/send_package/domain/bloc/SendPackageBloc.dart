import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newpostman1/features/send_package/data/PackageModel.dart';
import 'package:newpostman1/features/send_package/domain/events/SendPackageEvent.dart';

class SendPackageBloc extends Bloc<SendPackageEvent, PackageModel> {
  SendPackageBloc(PackageModel initialState) : super(PackageModel());

  @override
  Stream<PackageModel> mapEventToState(SendPackageEvent event) async* {
    switch (event.eventType) {
      case SendPackageEventType.addDataFromForm1:
        PackageModel packageModel = state;
        if (event.packageModel != null) {
          print("Adding data from form 1");
          packageModel = event.packageModel;
        }
        yield packageModel;
        break;

      case SendPackageEventType.addDataFromForm2:
        PackageModel packageModel = state;
        if (event.packageModel != null) {
          print("Adding data from form 2");

          packageModel.dLocation = event.packageModel.dLocation;
          packageModel.fLocation = event.packageModel.fLocation;
        }

        yield packageModel;
        break;
      default:
        throw Exception('event not found');
    }
  }
}
