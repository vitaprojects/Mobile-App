import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:newpostman1/features/Chat/data/chat_service.dart';
import 'package:newpostman1/features/Chat/data/chat_service_impl.dart';
import 'package:newpostman1/features/Check%20Internet%20connection/ConnectionStatusSingleton.dart';
import 'package:newpostman1/features/Check%20Internet%20connection/ConnectionStatusSingletonImpl.dart';
import 'package:newpostman1/features/My%20errands/domain/posted_errands_service.dart';
import 'package:newpostman1/features/My%20errands/domain/posted_errands_service_impl.dart';
import 'package:newpostman1/features/MyPackages/domain/posted_packages_service.dart';
import 'package:newpostman1/features/MyPackages/domain/posted_packages_service_impl.dart';
import 'package:newpostman1/features/MyTrips/domain/trip_service.dart';
import 'package:newpostman1/features/MyTrips/domain/trip_service_impl.dart';
import 'package:newpostman1/features/TotalEarnings/data/total_earnings_service.dart';
import 'package:newpostman1/features/TotalEarnings/data/total_earnings_service_impl.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/features/authentication/domain/auth_service_impl.dart';
import 'package:newpostman1/features/find_postman_for_errand/domain/find_available_postman_for_errand_service.dart';
import 'package:newpostman1/features/find_postman_for_errand/domain/find_available_postman_for_errand_service_impl.dart';
import 'package:newpostman1/features/find_postman_for_package/domain/find_available_postman_for_package_service.dart';
import 'package:newpostman1/features/find_postman_for_package/domain/find_available_postman_for_pacakge_service_impl.dart';
import 'package:newpostman1/features/home/domain/listen_to_events_service.dart';
import 'package:newpostman1/features/home/domain/listen_to_events_service_impl.dart';
import 'package:newpostman1/features/home/domain/respond_to_events_service.dart';
import 'package:newpostman1/features/home/domain/respond_to_events_service_impl.dart';
import 'package:newpostman1/features/payment/data/datasources/paymentDataSource.dart';
import 'package:newpostman1/features/post_errand/domain/ErrandService.dart';
import 'package:newpostman1/features/post_errand/domain/ErrandServiceImpl.dart';
import 'package:newpostman1/features/post_itinerary/domain/itinerary_service.dart';
import 'package:newpostman1/features/post_itinerary/domain/itinerary_service_impl.dart';
import 'package:newpostman1/features/send_package/domain/services/send_package_service.dart';
import 'package:newpostman1/features/send_package/domain/services/send_package_service_impl.dart';
import 'package:newpostman1/observables/user_data_observable.dart';
import 'package:newpostman1/services/LocationService.dart';
import 'package:newpostman1/services/LocationServiceImpl.dart';
import 'package:newpostman1/services/push_notification_service.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  //the service to handle the authentication
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceImplementation());

  // locator.registerLazySingleton<UserService>(() => UserServiceImpl());

//the service to show the snackbar
  locator.registerLazySingleton<SnackBarService>(() => SnackBarServiceImpl());

  //the service to send push notification
  locator.registerLazySingleton(() => PushNotificationService());

  //the snackbar service from stacked services
  locator.registerLazySingleton(() => SnackbarService());

  //the service for errands
  locator.registerLazySingleton<ErrandService>(() => ErrandServiceImpl());

  //the service to get location and other location relavant things
  locator.registerLazySingleton<LocationService>(() => LocationServiceImpl());

  //this service is regarding the itenaries
  locator.registerLazySingleton<ItenaryService>(() => ItenaryServiceImpl());

  //this service is for getting information about the trips(itenaries) of the user
  locator.registerLazySingleton<TripService>(() => TripServiceImpl());

  //this service is for the send package
  locator.registerLazySingleton<SendPackageService>(
      () => SendPackageServiceImpl());

  //this service is to get the posted packages of the user

  locator.registerLazySingleton<PostedPackagesService>(
      () => PostedPackagesServiceImpl());

  //this service is to get information about the posted errnds of the user

  locator.registerLazySingleton<PostedErrandsService>(
      () => PostedErrandsServiceImpl());

  //this service is to get the avaialble postmans for the pacakge of the user

  locator.registerLazySingleton<FindAvailablePostmanForPackageService>(
      () => FindAvailablePostmanForPackageServiceImpl());

  //this service is used to get available postman for the errand of the user

  locator.registerLazySingleton<FindAvailablePostmanForErrandService>(
      () => FindAvailablePostmanForErrandServiceImpl());

  //this service is from the stacked services to show dialog

  locator.registerLazySingleton(() => DialogService());

  //this service will listen to the changes in the home page

  locator.registerLazySingleton<ListenToEventsService>(
      () => ListenToEventsServiceImpl());

  //this service is used to response to the events the user , postman face
  locator.registerLazySingleton<RespondToEventsService>(
      () => RespondToEventsServiceImpl());

  locator.registerLazySingleton<ConnectionStatusSingleton>(
      () => ConnectionStatusSingletonImpl());

  ///Chat messages service
  locator.registerLazySingleton<ChatService>(() => ChatServiceImpl());

  ///total earnings service
  locator.registerLazySingleton<TotalEarningsService>(
      () => TotalEarningsServiceImpl());
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
  locator.registerLazySingleton(() => FirebaseAuth.instance);
  locator.registerLazySingleton(() => Uuid());
  //!All observables
  locator.registerLazySingleton(() => UserData());

  locator.registerLazySingleton<PaymentDataSource>(() => PaymentDataSourceImpl(
      firebaseAuth: locator(),
      uuid: locator(),
      firebaseFirestore: locator(),
      snackbarService: locator()));
}
