import 'package:get_it/get_it.dart';
import 'package:newpostman1/features/authentication/domain/auth_service.dart';
import 'package:newpostman1/features/authentication/domain/auth_service_impl.dart';
import 'package:newpostman1/services/push_notification_service.dart';
import 'package:newpostman1/services/snackbar_service.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceImplementation());

  // locator.registerLazySingleton<UserService>(() => UserServiceImpl());

  locator.registerLazySingleton<SnackBarService>(() => SnackBarServiceImpl());
  locator.registerLazySingleton(() => PushNotificationService());

  locator.registerLazySingleton(() => SnackbarService());
}
