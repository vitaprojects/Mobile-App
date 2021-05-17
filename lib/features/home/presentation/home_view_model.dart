import 'package:newpostman1/features/home/domain/listen_to_events_service.dart';
import 'package:newpostman1/observables/user_data_observable.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

const USER_DATA_KEY = "user_data";
const ORDER_DATA_KEY = "user_data";

class HomeViewModel extends MultipleStreamViewModel {
  ///Things to listen to as observables
  ///!all orders
  ///

  final ListenToEventsService listenToEventsService =
      locator<ListenToEventsService>();

  final UserData userData = locator<UserData>();
  @override
  Map<String, StreamData> get streamsMap => {
        USER_DATA_KEY:
            StreamData(listenToEventsService.getUserModelAsAStream()),
      };

  @override
  void onData(String key, data) {
    if (key == USER_DATA_KEY) {
      userData.setUserDataModel(data);
    } else if (key == ORDER_DATA_KEY) {}
    super.onData(key, data);
  }
}
