import 'package:newpostman1/features/find_postman_for_package/data/RequestModel.dart';
import 'package:newpostman1/features/home/domain/listen_to_events_service.dart';
import 'package:newpostman1/observables/user_data_observable.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const USER_DATA_KEY = "user_data";
const ORDER_DATA_KEY = "user_data";
const ORDER_CONFIRMED_DATA_KEY = "order_confirmed_data";

class HomeViewModel extends MultipleStreamViewModel {
  ///Things to listen to as observables
  ///!all orders
  ///

  final ListenToEventsService listenToEventsService =
      locator<ListenToEventsService>();

  final DialogService dialogService = locator<DialogService>();

  final UserData userData = locator<UserData>();
  @override
  Map<String, StreamData> get streamsMap => {
        USER_DATA_KEY:
            StreamData(listenToEventsService.getUserModelAsAStream()),
        ORDER_CONFIRMED_DATA_KEY: StreamData(
            listenToEventsService.listenToNewConfirmationsForthePostman()),
      };

  @override
  void onData(String key, data) async {
    if (key == USER_DATA_KEY) {
      userData.setUserDataModel(data);
    } else if (key == ORDER_CONFIRMED_DATA_KEY) {
      if (data != null && data.length != 0) {
        List<RequestModel> requests = data;
        RequestModel latestRequestModel = requests.first;
        var response = await dialogService.showDialog(
          title: 'Congratulations',
          description: 'You offer was accepted by ${latestRequestModel.user}',
          // barrierDismissible: true,
          // mainButtonTitle: 'Confirm',
          // confirmationTitle: "view".toUpperCase(),
          // cancelTitle: "cancel".toUpperCase(),
        );

        listenToEventsService
            .changeRequestStatusWhenOrderStarted(latestRequestModel);
      }
    }
    super.onData(key, data);
  }
}
