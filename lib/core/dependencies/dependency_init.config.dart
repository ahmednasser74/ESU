// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i24;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i3;
import '../../features/auth/data/repositories/auth_repository_imp.dart' as _i6;
import '../../features/auth/domin/repositories/auth_repository.dart' as _i5;
import '../../features/auth/domin/usecases/admission_usecase.dart' as _i52;
import '../../features/auth/domin/usecases/delete_fcm_token_usecase.dart'
    as _i9;
import '../../features/auth/domin/usecases/delete_user_account_usecase.dart'
    as _i10;
import '../../features/auth/domin/usecases/forget_password_usecase.dart'
    as _i12;
import '../../features/auth/domin/usecases/login_usecase.dart' as _i17;
import '../../features/auth/domin/usecases/lookup_use_case.dart' as _i19;
import '../../features/auth/domin/usecases/minimum_version_usecase.dart'
    as _i22;
import '../../features/auth/domin/usecases/register_fcm_token_usecase.dart'
    as _i26;
import '../../features/auth/domin/usecases/reset_password_usecase.dart' as _i28;
import '../../features/auth/presentation/controller/academic_info_controller.dart'
    as _i49;
import '../../features/auth/presentation/controller/forget_password_controller.dart'
    as _i60;
import '../../features/auth/presentation/controller/login_controller.dart'
    as _i65;
import '../../features/auth/presentation/controller/register_personal_info_controller.dart'
    as _i27;
import '../../features/auth/presentation/controller/reset_password_controller.dart'
    as _i70;
import '../../features/auth/presentation/controller/splash_controller.dart'
    as _i30;
import '../../features/auth/presentation/controller/submit_admission_controller.dart'
    as _i72;
import '../../features/home/data/datasources/home_remote_data_source.dart'
    as _i13;
import '../../features/home/data/repositories/home_repository_imp.dart' as _i15;
import '../../features/home/domin/repositories/home_repository.dart' as _i14;
import '../../features/home/domin/usecases/check_edit_profile_files_usecase.dart'
    as _i54;
import '../../features/home/domin/usecases/edit_profile_usecase.dart' as _i57;
import '../../features/home/domin/usecases/home_usecase.dart' as _i16;
import '../../features/home/domin/usecases/mark_all_notification_as_read_usecase.dart'
    as _i20;
import '../../features/home/domin/usecases/mark_single_notification_as_read_usecase.dart'
    as _i21;
import '../../features/home/domin/usecases/notification_usecase.dart' as _i61;
import '../../features/home/domin/usecases/popular_question_usecase.dart'
    as _i25;
import '../../features/home/presentation/controller/home_controller.dart'
    as _i62;
import '../../features/home/presentation/controller/logout_controler_controller.dart'
    as _i18;
import '../../features/home/presentation/controller/notification_controller.dart'
    as _i66;
import '../../features/home/presentation/controller/popular_question_controller.dart'
    as _i67;
import '../../features/home/presentation/controller/profile_controller.dart'
    as _i68;
import '../../features/home/presentation/controller/setting_controller.dart'
    as _i29;
import '../../features/student_actions/data/data_source/student_actions_remote_data_source.dart'
    as _i31;
import '../../features/student_actions/data/repository/student_actions_repository_imp.dart'
    as _i33;
import '../../features/student_actions/domain/repository/student_actions_repository.dart'
    as _i32;
import '../../features/student_actions/domain/usecase/add_course_use_case.dart'
    as _i51;
import '../../features/student_actions/domain/usecase/course_registration_availability_use_case.dart'
    as _i55;
import '../../features/student_actions/domain/usecase/courses_registrated_use_case.dart'
    as _i56;
import '../../features/student_actions/domain/usecase/remove_course_use_case.dart'
    as _i69;
import '../../features/student_actions/domain/usecase/term_register_pay_use_case.dart'
    as _i38;
import '../../features/student_actions/domain/usecase/term_registration_availability_use_case.dart'
    as _i39;
import '../../features/student_actions/domain/usecase/ticket_categories_use_case.dart'
    as _i42;
import '../../features/student_actions/domain/usecase/ticket_create_use_case.dart'
    as _i43;
import '../../features/student_actions/domain/usecase/ticket_details_single_use_case.dart'
    as _i44;
import '../../features/student_actions/domain/usecase/ticket_reply_use_case.dart'
    as _i45;
import '../../features/student_actions/domain/usecase/tickets_use_case.dart'
    as _i46;
import '../../features/student_actions/presentation/controller/add_course_controller.dart'
    as _i78;
import '../../features/student_actions/presentation/controller/courses_registered_controller.dart'
    as _i80;
import '../../features/student_actions/presentation/controller/term_registration_controller.dart'
    as _i40;
import '../../features/student_actions/presentation/controller/ticket_controller.dart'
    as _i75;
import '../../features/student_actions/presentation/controller/ticket_create_controller.dart'
    as _i73;
import '../../features/student_actions/presentation/controller/ticket_details_controller.dart'
    as _i74;
import '../../features/student_data/data/datasource/student_data_remote_data_source.dart'
    as _i34;
import '../../features/student_data/data/repository/student_data_repository_imp.dart'
    as _i36;
import '../../features/student_data/domain/repository/student_data_repository.dart'
    as _i35;
import '../../features/student_data/domain/usecase/access_to_moodle_use_case.dart'
    as _i50;
import '../../features/student_data/domain/usecase/attendance_use_case.dart'
    as _i53;
import '../../features/student_data/domain/usecase/finance_pay_url_use_case.dart'
    as _i58;
import '../../features/student_data/domain/usecase/finance_use_case.dart'
    as _i59;
import '../../features/student_data/domain/usecase/lecture_table_use_case.dart'
    as _i63;
import '../../features/student_data/domain/usecase/letters_use_case.dart'
    as _i64;
import '../../features/student_data/domain/usecase/schedule_use_case.dart'
    as _i71;
import '../../features/student_data/domain/usecase/study_plans_use_case.dart'
    as _i37;
import '../../features/student_data/domain/usecase/transcript_use_case.dart'
    as _i47;
import '../../features/student_data/presentation/controller/access_to_moodle_controller.dart'
    as _i77;
import '../../features/student_data/presentation/controller/attendance_controller.dart'
    as _i79;
import '../../features/student_data/presentation/controller/finance_controller.dart'
    as _i81;
import '../../features/student_data/presentation/controller/lecture_table_controller.dart'
    as _i82;
import '../../features/student_data/presentation/controller/letters_controller.dart'
    as _i83;
import '../../features/student_data/presentation/controller/schedule_controller.dart'
    as _i84;
import '../../features/student_data/presentation/controller/transcript_controller.dart'
    as _i76;
import '../cache/cache.dart' as _i7;
import '../dio/dio_helper.dart' as _i4;
import '../helper/firebase_analytics_helper.dart' as _i11;
import '../localization/translation_controller.dart' as _i48;
import '../network/network_information.dart' as _i23;
import '../src/theme/theme_controller.dart'
    as _i41; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthRemoteDataSource>(
      () => _i3.AuthRemoteDataSourceImp(dioHelper: get<_i4.DioHelper>()));
  gh.factory<_i5.AuthRepository>(() => _i6.AuthRepositoryImp(
      userRemoteDataSource: get<_i3.AuthRemoteDataSource>()));
  gh.singleton<_i7.CacheHelper>(
      _i7.CacheHelperImpl(get<_i8.SharedPreferences>()));
  gh.factory<_i9.DeleteFcmTokenUseCase>(() =>
      _i9.DeleteFcmTokenUseCase(authRepository: get<_i5.AuthRepository>()));
  gh.factory<_i10.DeleteUserAccountUseCase>(() =>
      _i10.DeleteUserAccountUseCase(authRepository: get<_i5.AuthRepository>()));
  gh.factory<_i11.FirebaseAnalyticsHelper>(
      () => _i11.FirebaseAnalyticsHelper());
  gh.factory<_i12.ForgetPasswordUseCase>(() =>
      _i12.ForgetPasswordUseCase(authRepository: get<_i5.AuthRepository>()));
  gh.factory<_i13.HomeRemoteDataSource>(
      () => _i13.HomeRemoteDataSourceImp(dioHelper: get<_i4.DioHelper>()));
  gh.factory<_i14.HomeRepository>(() => _i15.HomeRepositoryImp(
      remoteDataSource: get<_i13.HomeRemoteDataSource>()));
  gh.factory<_i16.HomeUseCase>(
      () => _i16.HomeUseCase(repository: get<_i14.HomeRepository>()));
  gh.factory<_i17.LoginUseCase>(
      () => _i17.LoginUseCase(authRepository: get<_i5.AuthRepository>()));
  gh.factory<_i18.LogoutController>(() => _i18.LogoutController(
      deleteFcmTokenUseCase: get<_i9.DeleteFcmTokenUseCase>()));
  gh.factory<_i19.LookupUseCase>(
      () => _i19.LookupUseCase(authRepository: get<_i5.AuthRepository>()));
  gh.factory<_i20.MarkAllNotificationAsReadUseCase>(() =>
      _i20.MarkAllNotificationAsReadUseCase(
          repository: get<_i14.HomeRepository>()));
  gh.factory<_i21.MarkSingleNotificationAsReadUseCase>(() =>
      _i21.MarkSingleNotificationAsReadUseCase(
          repository: get<_i14.HomeRepository>()));
  gh.factory<_i22.MinimumVersionUseCase>(() =>
      _i22.MinimumVersionUseCase(authRepository: get<_i5.AuthRepository>()));
  gh.factory<_i23.NetworkInformation>(() => _i23.NetworkInformationImp(
      internetConnectionChecker: get<_i24.InternetConnectionChecker>()));
  gh.factory<_i25.PopularQuestionUseCase>(() =>
      _i25.PopularQuestionUseCase(repository: get<_i14.HomeRepository>()));
  gh.factory<_i26.RegisterFcmTokenUseCase>(() =>
      _i26.RegisterFcmTokenUseCase(authRepository: get<_i5.AuthRepository>()));
  gh.factory<_i27.RegisterPersonalInfoController>(() =>
      _i27.RegisterPersonalInfoController(
          lookupUseCase: get<_i19.LookupUseCase>()));
  gh.factory<_i28.ResetPasswordUseCase>(() =>
      _i28.ResetPasswordUseCase(authRepository: get<_i5.AuthRepository>()));
  gh.factory<_i29.SettingController>(() => _i29.SettingController(
      deleteUserAccountUseCase: get<_i10.DeleteUserAccountUseCase>()));
  gh.factory<_i30.SplashController>(() => _i30.SplashController(
      registerFcmTokenUseCase: get<_i26.RegisterFcmTokenUseCase>(),
      minimumVersionUseCase: get<_i22.MinimumVersionUseCase>()));
  gh.factory<_i31.StudentActionsRemoteDataSource>(() =>
      _i31.StudentActionsRemoteDataSourceImp(dioHelper: get<_i4.DioHelper>()));
  gh.factory<_i32.StudentActionsRepository>(() =>
      _i33.StudentActionsRepositoryImp(
          remoteDataSource: get<_i31.StudentActionsRemoteDataSource>()));
  gh.factory<_i34.StudentDataRemoteDataSource>(() =>
      _i34.StudentDataRemoteDataSourceImp(dioHelper: get<_i4.DioHelper>()));
  gh.factory<_i35.StudentDataRepository>(() => _i36.StudentDataRepositoryImp(
      remoteDataSource: get<_i34.StudentDataRemoteDataSource>()));
  gh.factory<_i37.StudyPlansUseCase>(() => _i37.StudyPlansUseCase(
      studentDataRepository: get<_i35.StudentDataRepository>()));
  gh.factory<_i38.TermRegisterPayUseCase>(() => _i38.TermRegisterPayUseCase(
      studentActionsRepository: get<_i32.StudentActionsRepository>()));
  gh.factory<_i39.TermRegistrationAvailabilityUseCase>(() =>
      _i39.TermRegistrationAvailabilityUseCase(
          studentActionsRepository: get<_i32.StudentActionsRepository>()));
  gh.factory<_i40.TermRegistrationController>(() =>
      _i40.TermRegistrationController(
          availabilityTermRegistrationUseCase:
              get<_i39.TermRegistrationAvailabilityUseCase>(),
          termRegisterPayUseCase: get<_i38.TermRegisterPayUseCase>()));
  gh.factory<_i41.ThemeController>(() => _i41.ThemeController());
  gh.factory<_i42.TicketCategoriesUseCase>(() => _i42.TicketCategoriesUseCase(
      studentActionsRepository: get<_i32.StudentActionsRepository>()));
  gh.factory<_i43.TicketCreateUseCase>(() => _i43.TicketCreateUseCase(
      studentActionsRepository: get<_i32.StudentActionsRepository>()));
  gh.factory<_i44.TicketDetailsUseCase>(() => _i44.TicketDetailsUseCase(
      studentActionsRepository: get<_i32.StudentActionsRepository>()));
  gh.factory<_i45.TicketReplyUseCase>(() => _i45.TicketReplyUseCase(
      studentActionsRepository: get<_i32.StudentActionsRepository>()));
  gh.factory<_i46.TicketsUseCase>(() => _i46.TicketsUseCase(
      studentActionsRepository: get<_i32.StudentActionsRepository>()));
  gh.factory<_i47.TranscriptUseCase>(() => _i47.TranscriptUseCase(
      studentDataRepository: get<_i35.StudentDataRepository>()));
  gh.factory<_i48.TranslationController>(() => _i48.TranslationController());
  gh.factory<_i49.AcademicInfoController>(() =>
      _i49.AcademicInfoController(lookupUseCase: get<_i19.LookupUseCase>()));
  gh.factory<_i50.AccessToMoodleUseCase>(() => _i50.AccessToMoodleUseCase(
      studentDataRepository: get<_i35.StudentDataRepository>()));
  gh.factory<_i51.AddCoursesUseCase>(() => _i51.AddCoursesUseCase(
      studentActionsRepository: get<_i32.StudentActionsRepository>()));
  gh.factory<_i52.AdmissionUseCase>(
      () => _i52.AdmissionUseCase(authRepository: get<_i5.AuthRepository>()));
  gh.factory<_i53.AttendanceUseCase>(() => _i53.AttendanceUseCase(
      studentDataRepository: get<_i35.StudentDataRepository>()));
  gh.factory<_i54.CheckEditProfileFilesUseCase>(() =>
      _i54.CheckEditProfileFilesUseCase(
          repository: get<_i14.HomeRepository>()));
  gh.factory<_i55.CoursesAvailableUseCase>(() => _i55.CoursesAvailableUseCase(
      studentActionsRepository: get<_i32.StudentActionsRepository>()));
  gh.factory<_i56.CoursesRegisteredUseCase>(() => _i56.CoursesRegisteredUseCase(
      studentActionsRepository: get<_i32.StudentActionsRepository>()));
  gh.factory<_i57.EditProfileUseCase>(
      () => _i57.EditProfileUseCase(repository: get<_i14.HomeRepository>()));
  gh.factory<_i58.FinancePayUrlUseCase>(() => _i58.FinancePayUrlUseCase(
      studentDataRepository: get<_i35.StudentDataRepository>()));
  gh.factory<_i59.FinanceUseCase>(() => _i59.FinanceUseCase(
      studentDataRepository: get<_i35.StudentDataRepository>()));
  gh.factory<_i60.ForgetPasswordController>(() => _i60.ForgetPasswordController(
      forgetPasswordUseCase: get<_i12.ForgetPasswordUseCase>()));
  gh.factory<_i61.GetNotificationUseCase>(() =>
      _i61.GetNotificationUseCase(repository: get<_i14.HomeRepository>()));
  gh.factory<_i62.HomeController>(
      () => _i62.HomeController(homeUseCase: get<_i16.HomeUseCase>()));
  gh.factory<_i63.LectureTableUseCase>(() => _i63.LectureTableUseCase(
      studentDataRepository: get<_i35.StudentDataRepository>()));
  gh.factory<_i64.LettersUseCase>(() => _i64.LettersUseCase(
      studentDataRepository: get<_i35.StudentDataRepository>()));
  gh.factory<_i65.LoginController>(() => _i65.LoginController(
      loginUseCase: get<_i17.LoginUseCase>(),
      registerFcmTokenUseCase: get<_i26.RegisterFcmTokenUseCase>()));
  gh.factory<_i66.NotificationController>(() => _i66.NotificationController(
      getNotificationUseCase: get<_i61.GetNotificationUseCase>(),
      markAllNotificationAsReadUseCase:
          get<_i20.MarkAllNotificationAsReadUseCase>(),
      markSingleNotificationAsReadUseCase:
          get<_i21.MarkSingleNotificationAsReadUseCase>()));
  gh.factory<_i67.PopularQuestionController>(() =>
      _i67.PopularQuestionController(
          popularQuestionUseCase: get<_i25.PopularQuestionUseCase>()));
  gh.factory<_i68.ProfileController>(() => _i68.ProfileController(
      checkEditProfileFilesUseCase: get<_i54.CheckEditProfileFilesUseCase>(),
      editProfileUseCase: get<_i57.EditProfileUseCase>()));
  gh.factory<_i69.RemoveCourseUseCase>(() => _i69.RemoveCourseUseCase(
      studentActionsRepository: get<_i32.StudentActionsRepository>()));
  gh.factory<_i70.ResetPasswordController>(() => _i70.ResetPasswordController(
      resetPasswordUseCase: get<_i28.ResetPasswordUseCase>()));
  gh.factory<_i71.ScheduleUseCase>(() => _i71.ScheduleUseCase(
      studentDataRepository: get<_i35.StudentDataRepository>()));
  gh.factory<_i72.SubmitAdmissionController>(() =>
      _i72.SubmitAdmissionController(
          admissionUseCase: get<_i52.AdmissionUseCase>()));
  gh.factory<_i73.TicketCreateController>(() => _i73.TicketCreateController(
      ticketCreateUseCase: get<_i43.TicketCreateUseCase>(),
      ticketCategoriesUseCase: get<_i42.TicketCategoriesUseCase>()));
  gh.factory<_i74.TicketDetailsController>(() => _i74.TicketDetailsController(
      ticketDetailsUseCase: get<_i44.TicketDetailsUseCase>(),
      ticketReplyUseCase: get<_i45.TicketReplyUseCase>()));
  gh.factory<_i75.TicketsController>(
      () => _i75.TicketsController(ticketsUseCase: get<_i46.TicketsUseCase>()));
  gh.factory<_i76.TranscriptController>(() => _i76.TranscriptController(
      transcriptUseCase: get<_i47.TranscriptUseCase>()));
  gh.factory<_i77.AccessToMoodleController>(() => _i77.AccessToMoodleController(
      accessToMoodleUseCase: get<_i50.AccessToMoodleUseCase>()));
  gh.factory<_i78.AddCourseController>(() => _i78.AddCourseController(
      coursesAvailableUseCase: get<_i55.CoursesAvailableUseCase>(),
      addCoursesUseCase: get<_i51.AddCoursesUseCase>()));
  gh.factory<_i79.AttendanceController>(() => _i79.AttendanceController(
      attendanceUseCase: get<_i53.AttendanceUseCase>()));
  gh.factory<_i80.CourseRegisteredController>(() =>
      _i80.CourseRegisteredController(
          coursesRegisteredUseCase: get<_i56.CoursesRegisteredUseCase>(),
          removeCourseUseCase: get<_i69.RemoveCourseUseCase>()));
  gh.factory<_i81.FinanceController>(() => _i81.FinanceController(
      financeUseCase: get<_i59.FinanceUseCase>(),
      financePayUrlUseCase: get<_i58.FinancePayUrlUseCase>()));
  gh.factory<_i82.LectureTableController>(() => _i82.LectureTableController(
      lectureTableUseCase: get<_i63.LectureTableUseCase>()));
  gh.factory<_i83.LettersController>(
      () => _i83.LettersController(lettersUseCase: get<_i64.LettersUseCase>()));
  gh.factory<_i84.ScheduleController>(() =>
      _i84.ScheduleController(scheduleUseCase: get<_i71.ScheduleUseCase>()));
  return get;
}
