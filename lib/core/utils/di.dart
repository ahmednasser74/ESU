import 'dart:async';
import 'dart:isolate';

import 'package:boilerplate/core/cache/cache.dart';
import 'package:boilerplate/core/const/end_point.dart';
import 'package:boilerplate/core/dio/dio_helper.dart';
import 'package:boilerplate/core/dio/dio_request_handling.dart';
import 'package:boilerplate/core/dio/wrapper.dart';
import 'package:boilerplate/core/file_helper/file_downloader_db/file_downloader_db.dart';
import 'package:boilerplate/core/file_helper/file_downloader_db/file_downloader_model.dart';
import 'package:boilerplate/core/localization/translation_controller.dart';
import 'package:boilerplate/core/network/network_information.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:boilerplate/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:boilerplate/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:boilerplate/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:boilerplate/features/auth/domin/repositories/auth_repository.dart';
import 'package:boilerplate/features/auth/domin/usecases/admission_usecase.dart';
import 'package:boilerplate/features/auth/domin/usecases/forget_password_usecase.dart';
import 'package:boilerplate/features/auth/domin/usecases/login_usecase.dart';
import 'package:boilerplate/features/auth/domin/usecases/lookup_use_case.dart';
import 'package:boilerplate/features/auth/domin/usecases/reset_password_usecase.dart';
import 'package:boilerplate/features/auth/presentation/controller/academic_info_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/forget_password_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/login_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/personal_info_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/reset_password_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/splash_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/submit_admission_controller.dart';
import 'package:boilerplate/features/home/data/datasources/home_remote_data_source.dart';
import 'package:boilerplate/features/home/data/repositories/home_repository_imp.dart';
import 'package:boilerplate/features/home/domin/repositories/home_repository.dart';
import 'package:boilerplate/features/home/domin/usecases/check_edit_profile_files_usecase.dart';
import 'package:boilerplate/features/home/domin/usecases/edit_profile_usecase.dart';
import 'package:boilerplate/features/home/domin/usecases/home_usecase.dart';
import 'package:boilerplate/features/home/domin/usecases/mark_all_notification_as_read_usecase.dart';
import 'package:boilerplate/features/home/domin/usecases/mark_single_notification_as_read_usecase.dart';
import 'package:boilerplate/features/home/domin/usecases/notification_usecase.dart';
import 'package:boilerplate/features/home/domin/usecases/popular_question_usecase.dart';
import 'package:boilerplate/features/home/presentation/controller/home_controller.dart';
import 'package:boilerplate/features/home/presentation/controller/notification_controller.dart';
import 'package:boilerplate/features/home/presentation/controller/popular_question_controller.dart';
import 'package:boilerplate/features/home/presentation/controller/profile_controller.dart';
import 'package:boilerplate/features/home/presentation/controller/setting_controller.dart';
import 'package:boilerplate/features/student_actions/data/data_source/student_actions_remote_data_source.dart';
import 'package:boilerplate/features/student_actions/data/repository/student_actions_repository_imp.dart';
import 'package:boilerplate/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:boilerplate/features/student_actions/domain/usecase/term_register_pay_use_case.dart';
import 'package:boilerplate/features/student_actions/domain/usecase/term_registration_availability_use_case.dart';
import 'package:boilerplate/features/student_actions/domain/usecase/ticket_categories_use_case.dart';
import 'package:boilerplate/features/student_actions/domain/usecase/ticket_create_use_case.dart';
import 'package:boilerplate/features/student_actions/domain/usecase/ticket_details_single_use_case.dart';
import 'package:boilerplate/features/student_actions/domain/usecase/ticket_reply_use_case.dart';
import 'package:boilerplate/features/student_actions/domain/usecase/tickets_use_case.dart';
import 'package:boilerplate/features/student_actions/presentation/controller/term_registration_controller.dart';
import 'package:boilerplate/features/student_actions/presentation/controller/ticket_controller.dart';
import 'package:boilerplate/features/student_actions/presentation/controller/ticket_create_controller.dart';
import 'package:boilerplate/features/student_actions/presentation/controller/ticket_details_controller.dart';
import 'package:boilerplate/features/student_data/data/datasource/student_data_remote_data_source.dart';
import 'package:boilerplate/features/student_data/data/repository/student_data_repository_imp.dart';
import 'package:boilerplate/features/student_data/domain/repository/student_data_repository.dart';
import 'package:boilerplate/features/student_data/domain/usecase/Study_plans_use_case.dart';
import 'package:boilerplate/features/student_data/domain/usecase/access_to_moodle_use_case.dart';
import 'package:boilerplate/features/student_data/domain/usecase/finance_pay_url_use_case.dart';
import 'package:boilerplate/features/student_data/domain/usecase/finance_use_case.dart';
import 'package:boilerplate/features/student_data/domain/usecase/lecture_table_use_case.dart';
import 'package:boilerplate/features/student_data/domain/usecase/letters_use_case.dart';
import 'package:boilerplate/features/student_data/domain/usecase/schedule_use_case.dart';
import 'package:boilerplate/features/student_data/presentation/controller/access_to_moodle_controller.dart';
import 'package:boilerplate/features/student_data/presentation/controller/finance_controller.dart';
import 'package:boilerplate/features/student_data/presentation/controller/lecture_table_controller.dart';
import 'package:boilerplate/features/student_data/presentation/controller/letters_controller.dart';
import 'package:boilerplate/features/student_data/presentation/controller/schedule_controller.dart';
import 'package:boilerplate/features/student_data/presentation/controller/study_plans_controller.dart';
import 'package:boilerplate/features/student_data/presentation/controller/transcript_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Injection {
  static final di = GetIt.instance;

  static Future<void> init() async {
    await _core();
    _authCycle();
    _dioHelper();
    _homeCycle();
    _studentDataCycle();
    _studentActionsCycle();
    _hiveDb();
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

    //Network
    di.registerLazySingleton<NetworkInformation>(
      () => NetworkInformationImp(internetConnectionChecker: di()),
    );
  }

  static void _authCycle() {
    // Controller
    di.registerFactory<LoginController>(
      () => LoginController(
        loginUseCase: di(),
      ),
    );
    di.registerFactory<SubmitAdmissionController>(
      () => SubmitAdmissionController(
        admissionUseCase: di(),
      ),
    );
    di.registerFactory<SplashController>(
      () => SplashController(),
    );
    di.registerFactory<AcademicInfoController>(
      () => AcademicInfoController(lookupUseCase: di()),
    );
    di.registerFactory<PersonalInfoController>(
      () => PersonalInfoController(lookupUseCase: di()),
    );
    di.registerFactory<ForgetPasswordController>(
      () => ForgetPasswordController(forgetPasswordUseCase: di()),
    );
    di.registerFactory<ResetPasswordController>(
      () => ResetPasswordController(resetPasswordUseCase: di()),
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
    di.registerLazySingleton<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(authRepository: di()),
    );
    di.registerLazySingleton<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(authRepository: di()),
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
  }

  static void _homeCycle() {
    // Controller
    di.registerFactory<ProfileController>(
      () => ProfileController(
        checkEditProfileFilesUseCase: di(),
        editProfileUseCase: di(),
      ),
    );
    di.registerFactory<SettingController>(() => SettingController());
    di.registerFactory<PopularQuestionController>(
      () => PopularQuestionController(popularQuestionUseCase: di()),
    );
    di.registerFactory<HomeController>(
      () => HomeController(homeUseCase: di()),
    );
    di.registerFactory<NotificationController>(
      () => NotificationController(
        getNotificationUseCase: di(),
        markAllNotificationAsReadUseCase: di(),
        markSingleNotificationAsReadUseCase: di(),
      ),
    );

    // Use cases
    di.registerLazySingleton<GetNotificationUseCase>(
      () => GetNotificationUseCase(repository: di()),
    );
    di.registerLazySingleton<HomeUseCase>(
      () => HomeUseCase(repository: di()),
    );
    di.registerLazySingleton<MarkAllNotificationAsReadUseCase>(
      () => MarkAllNotificationAsReadUseCase(repository: di()),
    );
    di.registerLazySingleton<MarkSingleNotificationAsReadUseCase>(
      () => MarkSingleNotificationAsReadUseCase(repository: di()),
    );
    di.registerLazySingleton<CheckEditProfileFilesUseCase>(
      () => CheckEditProfileFilesUseCase(repository: di()),
    );
    di.registerLazySingleton<EditProfileUseCase>(
      () => EditProfileUseCase(repository: di()),
    );
    di.registerLazySingleton<PopularQuestionUseCase>(
      () => PopularQuestionUseCase(repository: di()),
    );

    //repo
    di.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImp(remoteDataSource: di()),
    );

    // Data sources
    di.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImp(dioHelper: di()),
    );
  }

  static void _studentDataCycle() {
    // Controller
    di.registerFactory<LettersController>(
      () => LettersController(lettersUseCase: di()),
    );
    di.registerFactory<TranscriptController>(() => TranscriptController());
    di.registerFactory<FinanceController>(
      () => FinanceController(
        financeUseCase: di(),
        financePayUrlUseCase: di(),
      ),
    );
    di.registerFactory<StudyPlansController>(
      () => StudyPlansController(studyPlansUseCase: di()),
    );
    di.registerFactory<ScheduleController>(
      () => ScheduleController(scheduleUseCase: di()),
    );
    di.registerFactory<AccessToMoodleController>(
      () => AccessToMoodleController(accessToMoodleUseCase: di()),
    );
    di.registerFactory<LectureTableController>(
      () => LectureTableController(lectureTableUseCase: di()),
    );

    //Use cases
    di.registerLazySingleton<LettersUseCase>(
      () => LettersUseCase(studentDataRepository: di()),
    );
    di.registerLazySingleton<StudyPlansUseCase>(
      () => StudyPlansUseCase(studentDataRepository: di()),
    );
    di.registerLazySingleton<FinanceUseCase>(
      () => FinanceUseCase(studentDataRepository: di()),
    );
    di.registerLazySingleton<FinancePayUrlUseCase>(
      () => FinancePayUrlUseCase(studentDataRepository: di()),
    );
    di.registerLazySingleton<ScheduleUseCase>(
      () => ScheduleUseCase(studentDataRepository: di()),
    );
    di.registerLazySingleton<AccessToMoodleUseCase>(
      () => AccessToMoodleUseCase(studentDataRepository: di()),
    );
    di.registerLazySingleton<LectureTableUseCase>(
      () => LectureTableUseCase(studentDataRepository: di()),
    );

    //repo
    di.registerLazySingleton<StudentDataRepository>(
      () => StudentDataRepositoryImp(remoteDataSource: di()),
    );

    // Data sources
    di.registerLazySingleton<StudentDataRemoteDataSource>(
      () => StudentDataRemoteDataSourceImp(dioHelper: di()),
    );
  }

  static void _studentActionsCycle() {
    // Controller
    di.registerFactory<TermRegistrationController>(
      () => TermRegistrationController(
        availabilityTermRegistrationUseCase: di(),
        termRegisterPayUseCase: di(),
      ),
    );
    di.registerFactory<TicketCreateController>(
      () => TicketCreateController(
        ticketCreateUseCase: di(),
        ticketCategoriesUseCase: di(),
      ),
    );
    di.registerFactory<TicketsController>(
      () => TicketsController(ticketsUseCase: di()),
    );
    di.registerFactory<TicketDetailsController>(
      () => TicketDetailsController(
        ticketDetailsUseCase: di(),
        ticketReplyUseCase: di(),
      ),
    );

    //Use cases
    di.registerLazySingleton<TermRegisterPayUseCase>(
      () => TermRegisterPayUseCase(studentActionsRepository: di()),
    );
    di.registerLazySingleton<TermRegistrationAvailabilityUseCase>(
      () => TermRegistrationAvailabilityUseCase(studentActionsRepository: di()),
    );
    di.registerLazySingleton<TicketCategoriesUseCase>(
      () => TicketCategoriesUseCase(studentActionsRepository: di()),
    );
    di.registerLazySingleton<TicketCreateUseCase>(
      () => TicketCreateUseCase(studentActionsRepository: di()),
    );
    di.registerLazySingleton<TicketReplyUseCase>(
      () => TicketReplyUseCase(studentActionsRepository: di()),
    );
    di.registerLazySingleton<TicketDetailsUseCase>(
      () => TicketDetailsUseCase(studentActionsRepository: di()),
    );
    di.registerLazySingleton<TicketsUseCase>(
      () => TicketsUseCase(studentActionsRepository: di()),
    );

    //repo
    di.registerLazySingleton<StudentActionsRepository>(
      () => StudentActionsRepositoryImp(remoteDataSource: di()),
    );

    // Data sources
    di.registerLazySingleton<StudentActionsRemoteDataSource>(
      () => StudentActionsRemoteDataSourceImp(dioHelper: di()),
    );

    //ticket files
    di.registerLazySingleton<ReceivePort>(
      () => ReceivePort(),
    );

    di.registerLazySingleton<StreamController>(
      () {
        final stream = StreamController<dynamic>.broadcast();
        di<ReceivePort>().listen((message) {
          di<StreamController>().add(message);
        });
        return stream;
      },
    );
  }

  static void _hiveDb() async {
    final fileDownloaderBox = await FileDownloadedDbHelper.openBox();
    di.registerLazySingleton<Box<FileDownloadedModel>>(
      () => fileDownloaderBox,
    );
    di.registerLazySingleton<FileDownloadedDbHelper>(
      () => FileDownloadedDbHelperImpl(di<Box<FileDownloadedModel>>()),
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
