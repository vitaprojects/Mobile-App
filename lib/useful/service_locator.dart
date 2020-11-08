import 'package:get_it/get_it.dart';
import 'package:newpostman1/features/MyTrips/domain/trip_service.dart';
import 'package:newpostman1/features/MyTrips/domain/trip_service_impl.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/features/authentication/domain/auth_service_impl.dart';
import 'package:newpostman1/features/post_errand/domain/ErrandService.dart';
import 'package:newpostman1/features/post_errand/domain/ErrandServiceImpl.dart';
import 'package:newpostman1/features/post_itenary/domain/ItenaryService.dart';
import 'package:newpostman1/features/post_itenary/domain/ItenaryServiceImpl.dart';
import 'package:newpostman1/features/send_package/domain/services/send_package_service.dart';
import 'package:newpostman1/features/send_package/domain/services/send_package_service_impl.dart';
import 'package:newpostman1/services/LocationService.dart';
import 'package:newpostman1/services/LocationServiceImpl.dart';
import 'package:newpostman1/services/push_notification_service.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:stacked_services/stacked_services.dart';

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
}
