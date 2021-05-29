import 'package:newpostman1/features/home/data/OrderModel.dart';
import 'package:newpostman1/features/home/domain/listen_to_events_service.dart';
import 'package:newpostman1/useful/service_locator.dart';
import 'package:stacked/stacked.dart';

class OngoingOrdersViewModel extends StreamViewModel<List<OrderModel>> {
  final ListenToEventsService listenToEventsService =
      locator<ListenToEventsService>();
  @override
  Stream<List<OrderModel>> get stream =>
      listenToEventsService.listentoAllOngoingOrdersOfthePostman();

  @override
  void onData(data) {
    super.onData(data);
  }
}
