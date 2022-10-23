import 'dart:async';
import 'dart:isolate';

import 'package:esu/core/const/end_point.dart';
import 'package:esu/core/dio/dio_helper.dart';
import 'package:esu/core/dio/dio_request_handling.dart';
import 'package:esu/core/dio/wrapper.dart';
import 'package:esu/core/network/network_information.dart';
import 'package:esu/core/notification_helper/notification_helper.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/student_data/presentation/controller/study_plans_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/file_download_helper/file_downloader_db/file_downloader_db.dart';
import '../helper/file_download_helper/file_downloader_db/file_downloader_model.dart';
import 'package:injectable/injectable.dart';
import '../../features/student_data/presentation/controller/study_plans_controller.dart';
import '../utils/pref_util.dart';
import 'dependency_init.config.dart';

final GetIt di = GetIt.instance;

@InjectableInit(
  usesNullSafety: true,
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<GetIt> configureDependencies() async {
  final sp = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => sp);

  final sharedPreferences = await SharedPrefs.instance.init();
  di.registerSingleton<SharedPrefs>(sharedPreferences);

  di.registerFactory(() => StudyPlansController(studyPlansUseCase: di()));

  _core();
  _dioHelper();
  _hiveDb();

  return $initGetIt(di);
}

void _core() {
  di.registerFactory(() => FcmTokenUpdate(registerFcmTokenUseCase: di()));
  di.registerFactory<InternetConnectionChecker>(() => InternetConnectionChecker());

  //ticket files
  di.registerLazySingleton<ReceivePort>(
        () => ReceivePort(),
  );

  di.registerLazySingleton<StreamController>(
        () {
      final stream = StreamController<dynamic>.broadcast();
      di<ReceivePort>().listen((message) => di<StreamController>().add(message));
      return stream;
    },
  );
}

void _hiveDb() async {
  final fileDownloaderBox = await FileDownloadedDbHelper.openBox();
  di.registerLazySingleton<Box<FileDownloadedModel>>(() => fileDownloaderBox);
  di.registerLazySingleton<FileDownloadedDbHelper>(
    () => FileDownloadedDbHelperImpl(di<Box<FileDownloadedModel>>()),
  );
}

void _dioHelper() {
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
