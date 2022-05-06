import 'package:boilerplate/core/cache/cache.dart';
import 'package:boilerplate/core/const/end_point.dart';
import 'package:boilerplate/core/dio/dio_helper.dart';
import 'package:boilerplate/core/dio/dio_request_handling.dart';
import 'package:boilerplate/core/dio/wrapper.dart';
import 'package:boilerplate/core/localization/translation_controller.dart';
import 'package:boilerplate/core/network/network_information.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:boilerplate/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:boilerplate/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:boilerplate/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:boilerplate/features/auth/domin/repositories/auth_repository.dart';
import 'package:boilerplate/features/auth/domin/usecases/admission_usecase.dart';
import 'package:boilerplate/features/auth/domin/usecases/login_usecase.dart';
import 'package:boilerplate/features/auth/domin/usecases/lookup_use_case.dart';
import 'package:boilerplate/features/auth/presentation/controller/admission_controller.dart';
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
    _dioHelper();
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
    di.registerLazySingleton<CacheHelper>(
      () => CacheImpl(
        di<SharedPreferences>(),
      ),
    );
    //controller
    di.registerFactory<TranslationController>(() => TranslationController());
  }

  static void _authCycle() {
    // Controller
    di.registerFactory<LoginController>(
      () => LoginController(
        loginUseCase: di(),
      ),
    );
    di.registerFactory<AdmissionController>(
      () => AdmissionController(
        admissionUseCase: di(),
      ),
    );
    di.registerFactory<SplashController>(
      () => SplashController(),
    );

    // Use cases
    di.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: di()),
    );
    di.registerLazySingleton<AdmissionUseCase>(
      () => AdmissionUseCase(authRepository: di()),
    );
    di.registerLazySingleton<LookupUseCase>(
      () => LookupUseCase(authRepository: di()),
    );

    //repo
    di.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(
        userLocalDataSource: di(),
        userRemoteDataSource: di(),
      ),
    );

    // Data sources
    di.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(dioHelper: di()),
    );
    di.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImp(sharedPreferences: di()),
    );
    di.registerLazySingleton<NetworkInformation>(
      () => NetworkInformationImp(internetConnectionChecker: di()),
    );
  }

  static void _dioHelper() {
    di.registerFactory<DioRequestHandlingController>(
      () => DioRequestHandlingController(networkInformation: di()),
    );

    di.registerLazySingleton<DioHelper>(
      () => DioImpl(
        baseURL: Endpoints.baseUrl,
        onRequest: di<DioRequestHandlingController>().onRequestCallback,
        onResponse: di<DioRequestHandlingController>().onResponseCallback,
        onError: di<DioRequestHandlingController>().onErrorCallback,
      ),
    );
  }
}
