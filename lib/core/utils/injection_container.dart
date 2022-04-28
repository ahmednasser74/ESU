import 'package:boilerplate/core/localization/translation_controller.dart';
import 'package:boilerplate/core/network/network_information.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:boilerplate/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:boilerplate/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:boilerplate/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:boilerplate/features/auth/domin/repositories/auth_repository.dart';
import 'package:boilerplate/features/auth/domin/usecases/is_online_usecase.dart';
import 'package:boilerplate/features/auth/domin/usecases/is_user_login_use_case.dart';
import 'package:boilerplate/features/auth/domin/usecases/login_usecase.dart';
import 'package:boilerplate/features/auth/domin/usecases/logout_usecase.dart';
import 'package:boilerplate/features/auth/presentation/controller/login_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/splash_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Injection {
  static final di = GetIt.instance;

  static Future<void> init() async {
    await _core();
    _authCycle();
  }

  static Future<void> _core() async {
    // shared preference
    final sp = await SharedPreferences.getInstance();
    di.registerLazySingleton<SharedPreferences>(() => sp);

    final sharedPreferences = await SharedPrefs.instance.init();
    di.registerSingleton<SharedPrefs>(sharedPreferences);
    // localization
    di.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker(),
    );
    //controller
    di.registerFactory<TranslationController>(() => TranslationController());
  }

  static void _authCycle() {
    // Controller
    di.registerFactory<LoginController>(
      () => LoginController(
        loginUseCase: di(),
        isOnlineUseCase: di(),
        logoutUseCase: di(),
      ),
    );
    di.registerFactory<SplashController>(
      () => SplashController(isUserLoginUseCase: di()),
    );

    // Use cases
    di.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: di()),
    );
    di.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(authRepository: di()),
    );
    di.registerLazySingleton<IsUserLoginUseCase>(
      () => IsUserLoginUseCase(authRepository: di()),
    );
    di.registerLazySingleton<IsOnlineUseCase>(
      () => IsOnlineUseCase(authRepository: di()),
    );

    //repo
    di.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(
        networkInformation: di(),
        userLocalDataSource: di(),
        userRemoteDataSource: di(),
      ),
    );

    // Data sources
    di.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(),
    );
    di.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImp(sharedPreferences: di()),
    );
    di.registerLazySingleton<NetworkInformation>(
      () => NetworkInformationImp(internetConnectionChecker: di()),
    );
  }
}
