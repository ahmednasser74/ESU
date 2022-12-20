// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i25;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i3;
import '../../features/auth/data/repositories/auth_repository_imp.dart' as _i6;
import '../../features/auth/domin/repositories/auth_repository.dart' as _i5;
import '../../features/auth/domin/usecases/admission_usecase.dart' as _i53;
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
    as _i27;
import '../../features/auth/domin/usecases/reset_password_usecase.dart' as _i29;
import '../../features/auth/presentation/controller/academic_info_controller.dart'
    as _i50;
import '../../features/auth/presentation/controller/forget_password_controller.dart'
    as _i61;
import '../../features/auth/presentation/controller/login_controller.dart'
    as _i66;
import '../../features/auth/presentation/controller/register_personal_info_controller.dart'
    as _i28;
import '../../features/auth/presentation/controller/reset_password_controller.dart'
    as _i72;
import '../../features/auth/presentation/controller/splash_controller.dart'
    as _i31;
import '../../features/auth/presentation/controller/submit_admission_controller.dart'
    as _i74;
import '../../features/home/data/datasources/home_remote_data_source.dart'
    as _i13;
import '../../features/home/data/repositories/home_repository_imp.dart' as _i15;
import '../../features/home/domin/repositories/home_repository.dart' as _i14;
import '../../features/home/domin/usecases/check_edit_profile_files_usecase.dart'
    as _i55;
import '../../features/home/domin/usecases/edit_profile_usecase.dart' as _i58;
import '../../features/home/domin/usecases/home_usecase.dart' as _i16;
import '../../features/home/domin/usecases/mark_all_notification_as_read_usecase.dart'
    as _i20;
import '../../features/home/domin/usecases/mark_single_notification_as_read_usecase.dart'
    as _i21;
import '../../features/home/domin/usecases/moodle_login_usecase.dart' as _i23;
import '../../features/home/domin/usecases/notification_usecase.dart' as _i62;
import '../../features/home/domin/usecases/popular_question_usecase.dart'
    as _i26;
import '../../features/home/presentation/controller/home_controller.dart'
    as _i63;
import '../../features/home/presentation/controller/logout_controler_controller.dart'
    as _i18;
import '../../features/home/presentation/controller/moodle_login_controller.dart'
    as _i67;
import '../../features/home/presentation/controller/notification_controller.dart'
    as _i68;
import '../../features/home/presentation/controller/popular_question_controller.dart'
    as _i69;
import '../../features/home/presentation/controller/profile_controller.dart'
    as _i70;
import '../../features/home/presentation/controller/setting_controller.dart'
    as _i30;
import '../../features/student_actions/data/data_source/student_actions_remote_data_source.dart'
    as _i32;
import '../../features/student_actions/data/repository/student_actions_repository_imp.dart'
    as _i34;
import '../../features/student_actions/domain/repository/student_actions_repository.dart'
    as _i33;
import '../../features/student_actions/domain/usecase/add_course_use_case.dart'
    as _i52;
import '../../features/student_actions/domain/usecase/course_registration_availability_use_case.dart'
    as _i56;
import '../../features/student_actions/domain/usecase/courses_registrated_use_case.dart'
    as _i57;
import '../../features/student_actions/domain/usecase/remove_course_use_case.dart'
    as _i71;
import '../../features/student_actions/domain/usecase/term_register_pay_use_case.dart'
    as _i39;
import '../../features/student_actions/domain/usecase/term_registration_availability_use_case.dart'
    as _i40;
import '../../features/student_actions/domain/usecase/ticket_categories_use_case.dart'
    as _i43;
import '../../features/student_actions/domain/usecase/ticket_create_use_case.dart'
    as _i44;
import '../../features/student_actions/domain/usecase/ticket_details_single_use_case.dart'
    as _i45;
import '../../features/student_actions/domain/usecase/ticket_reply_use_case.dart'
    as _i46;
import '../../features/student_actions/domain/usecase/tickets_use_case.dart'
    as _i47;
import '../../features/student_actions/presentation/controller/add_course_controller.dart'
    as _i80;
import '../../features/student_actions/presentation/controller/courses_registered_controller.dart'
    as _i82;
import '../../features/student_actions/presentation/controller/term_registration_controller.dart'
    as _i41;
import '../../features/student_actions/presentation/controller/ticket_controller.dart'
    as _i77;
import '../../features/student_actions/presentation/controller/ticket_create_controller.dart'
    as _i75;
import '../../features/student_actions/presentation/controller/ticket_details_controller.dart'
    as _i76;
import '../../features/student_data/data/datasource/student_data_remote_data_source.dart'
    as _i35;
import '../../features/student_data/data/repository/student_data_repository_imp.dart'
    as _i37;
import '../../features/student_data/domain/repository/student_data_repository.dart'
    as _i36;
import '../../features/student_data/domain/usecase/access_to_moodle_use_case.dart'
    as _i51;
import '../../features/student_data/domain/usecase/attendance_use_case.dart'
    as _i54;
import '../../features/student_data/domain/usecase/finance_pay_url_use_case.dart'
    as _i59;
import '../../features/student_data/domain/usecase/finance_use_case.dart'
    as _i60;
import '../../features/student_data/domain/usecase/lecture_table_use_case.dart'
    as _i64;
import '../../features/student_data/domain/usecase/letters_use_case.dart'
    as _i65;
import '../../features/student_data/domain/usecase/schedule_use_case.dart'
    as _i73;
import '../../features/student_data/domain/usecase/study_plans_use_case.dart'
    as _i38;
import '../../features/student_data/domain/usecase/transcript_use_case.dart'
    as _i48;
import '../../features/student_data/presentation/controller/access_to_moodle_controller.dart'
    as _i79;
import '../../features/student_data/presentation/controller/attendance_controller.dart'
    as _i81;
import '../../features/student_data/presentation/controller/finance_controller.dart'
    as _i83;
import '../../features/student_data/presentation/controller/lecture_table_controller.dart'
    as _i84;
import '../../features/student_data/presentation/controller/letters_controller.dart'
    as _i85;
import '../../features/student_data/presentation/controller/schedule_controller.dart'
    as _i86;
import '../../features/student_data/presentation/controller/transcript_controller.dart'
    as _i78;
import '../cache/cache.dart' as _i7;
import '../dio/dio_helper.dart' as _i4;
import '../helper/firebase_analytics_helper.dart' as _i11;
import '../localization/translation_controller.dart' as _i49;
import '../network/network_information.dart' as _i24;
import '../src/theme/theme_controller.dart'
    as _i42; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i23.MoodleLoginUseCase>(
      () => _i23.MoodleLoginUseCase(repository: get<_i14.HomeRepository>()));
  gh.factory<_i24.NetworkInformation>(() => _i24.NetworkInformationImp(
      internetConnectionChecker: get<_i25.InternetConnectionChecker>()));
  gh.factory<_i26.PopularQuestionUseCase>(() =>
      _i26.PopularQuestionUseCase(repository: get<_i14.HomeRepository>()));
  gh.factory<_i27.RegisterFcmTokenUseCase>(() =>
      _i27.RegisterFcmTokenUseCase(authRepository: get<_i5.AuthRepository>()));
  gh.factory<_i28.RegisterPersonalInfoController>(() =>
      _i28.RegisterPersonalInfoController(
          lookupUseCase: get<_i19.LookupUseCase>()));
  gh.factory<_i29.ResetPasswordUseCase>(() =>
      _i29.ResetPasswordUseCase(authRepository: get<_i5.AuthRepository>()));
  gh.factory<_i30.SettingController>(() => _i30.SettingController(
      deleteUserAccountUseCase: get<_i10.DeleteUserAccountUseCase>()));
  gh.factory<_i31.SplashController>(() => _i31.SplashController(
      registerFcmTokenUseCase: get<_i27.RegisterFcmTokenUseCase>(),
      minimumVersionUseCase: get<_i22.MinimumVersionUseCase>()));
  gh.factory<_i32.StudentActionsRemoteDataSource>(() =>
      _i32.StudentActionsRemoteDataSourceImp(dioHelper: get<_i4.DioHelper>()));
  gh.factory<_i33.StudentActionsRepository>(() =>
      _i34.StudentActionsRepositoryImp(
          remoteDataSource: get<_i32.StudentActionsRemoteDataSource>()));
  gh.factory<_i35.StudentDataRemoteDataSource>(() =>
      _i35.StudentDataRemoteDataSourceImp(dioHelper: get<_i4.DioHelper>()));
  gh.factory<_i36.StudentDataRepository>(() => _i37.StudentDataRepositoryImp(
      remoteDataSource: get<_i35.StudentDataRemoteDataSource>()));
  gh.factory<_i38.StudyPlansUseCase>(() => _i38.StudyPlansUseCase(
      studentDataRepository: get<_i36.StudentDataRepository>()));
  gh.factory<_i39.TermRegisterPayUseCase>(() => _i39.TermRegisterPayUseCase(
      studentActionsRepository: get<_i33.StudentActionsRepository>()));
  gh.factory<_i40.TermRegistrationAvailabilityUseCase>(() =>
      _i40.TermRegistrationAvailabilityUseCase(
          studentActionsRepository: get<_i33.StudentActionsRepository>()));
  gh.factory<_i41.TermRegistrationController>(() =>
      _i41.TermRegistrationController(
          availabilityTermRegistrationUseCase:
              get<_i40.TermRegistrationAvailabilityUseCase>(),
          termRegisterPayUseCase: get<_i39.TermRegisterPayUseCase>()));
  gh.factory<_i42.ThemeController>(() => _i42.ThemeController());
  gh.factory<_i43.TicketCategoriesUseCase>(() => _i43.TicketCategoriesUseCase(
      studentActionsRepository: get<_i33.StudentActionsRepository>()));
  gh.factory<_i44.TicketCreateUseCase>(() => _i44.TicketCreateUseCase(
      studentActionsRepository: get<_i33.StudentActionsRepository>()));
  gh.factory<_i45.TicketDetailsUseCase>(() => _i45.TicketDetailsUseCase(
      studentActionsRepository: get<_i33.StudentActionsRepository>()));
  gh.factory<_i46.TicketReplyUseCase>(() => _i46.TicketReplyUseCase(
      studentActionsRepository: get<_i33.StudentActionsRepository>()));
  gh.factory<_i47.TicketsUseCase>(() => _i47.TicketsUseCase(
      studentActionsRepository: get<_i33.StudentActionsRepository>()));
  gh.factory<_i48.TranscriptUseCase>(() => _i48.TranscriptUseCase(
      studentDataRepository: get<_i36.StudentDataRepository>()));
  gh.factory<_i49.TranslationController>(() => _i49.TranslationController());
  gh.factory<_i50.AcademicInfoController>(() =>
      _i50.AcademicInfoController(lookupUseCase: get<_i19.LookupUseCase>()));
  gh.factory<_i51.AccessToMoodleUseCase>(() => _i51.AccessToMoodleUseCase(
      studentDataRepository: get<_i36.StudentDataRepository>()));
  gh.factory<_i52.AddCoursesUseCase>(() => _i52.AddCoursesUseCase(
      studentActionsRepository: get<_i33.StudentActionsRepository>()));
  gh.factory<_i53.AdmissionUseCase>(
      () => _i53.AdmissionUseCase(authRepository: get<_i5.AuthRepository>()));
  gh.factory<_i54.AttendanceUseCase>(() => _i54.AttendanceUseCase(
      studentDataRepository: get<_i36.StudentDataRepository>()));
  gh.factory<_i55.CheckEditProfileFilesUseCase>(() =>
      _i55.CheckEditProfileFilesUseCase(
          repository: get<_i14.HomeRepository>()));
  gh.factory<_i56.CoursesAvailableUseCase>(() => _i56.CoursesAvailableUseCase(
      studentActionsRepository: get<_i33.StudentActionsRepository>()));
  gh.factory<_i57.CoursesRegisteredUseCase>(() => _i57.CoursesRegisteredUseCase(
      studentActionsRepository: get<_i33.StudentActionsRepository>()));
  gh.factory<_i58.EditProfileUseCase>(
      () => _i58.EditProfileUseCase(repository: get<_i14.HomeRepository>()));
  gh.factory<_i59.FinancePayUrlUseCase>(() => _i59.FinancePayUrlUseCase(
      studentDataRepository: get<_i36.StudentDataRepository>()));
  gh.factory<_i60.FinanceUseCase>(() => _i60.FinanceUseCase(
      studentDataRepository: get<_i36.StudentDataRepository>()));
  gh.factory<_i61.ForgetPasswordController>(() => _i61.ForgetPasswordController(
      forgetPasswordUseCase: get<_i12.ForgetPasswordUseCase>()));
  gh.factory<_i62.GetNotificationUseCase>(() =>
      _i62.GetNotificationUseCase(repository: get<_i14.HomeRepository>()));
  gh.factory<_i63.HomeController>(
      () => _i63.HomeController(homeUseCase: get<_i16.HomeUseCase>()));
  gh.factory<_i64.LectureTableUseCase>(() => _i64.LectureTableUseCase(
      studentDataRepository: get<_i36.StudentDataRepository>()));
  gh.factory<_i65.LettersUseCase>(() => _i65.LettersUseCase(
      studentDataRepository: get<_i36.StudentDataRepository>()));
  gh.factory<_i66.LoginController>(() => _i66.LoginController(
      loginUseCase: get<_i17.LoginUseCase>(),
      registerFcmTokenUseCase: get<_i27.RegisterFcmTokenUseCase>()));
  gh.factory<_i67.MoodleLoginController>(() => _i67.MoodleLoginController(
      moodleLoginUseCase: get<_i23.MoodleLoginUseCase>()));
  gh.factory<_i68.NotificationController>(() => _i68.NotificationController(
      getNotificationUseCase: get<_i62.GetNotificationUseCase>(),
      markAllNotificationAsReadUseCase:
          get<_i20.MarkAllNotificationAsReadUseCase>(),
      markSingleNotificationAsReadUseCase:
          get<_i21.MarkSingleNotificationAsReadUseCase>()));
  gh.factory<_i69.PopularQuestionController>(() =>
      _i69.PopularQuestionController(
          popularQuestionUseCase: get<_i26.PopularQuestionUseCase>()));
  gh.factory<_i70.ProfileController>(() => _i70.ProfileController(
      checkEditProfileFilesUseCase: get<_i55.CheckEditProfileFilesUseCase>(),
      editProfileUseCase: get<_i58.EditProfileUseCase>()));
  gh.factory<_i71.RemoveCourseUseCase>(() => _i71.RemoveCourseUseCase(
      studentActionsRepository: get<_i33.StudentActionsRepository>()));
  gh.factory<_i72.ResetPasswordController>(() => _i72.ResetPasswordController(
      resetPasswordUseCase: get<_i29.ResetPasswordUseCase>()));
  gh.factory<_i73.ScheduleUseCase>(() => _i73.ScheduleUseCase(
      studentDataRepository: get<_i36.StudentDataRepository>()));
  gh.factory<_i74.SubmitAdmissionController>(() =>
      _i74.SubmitAdmissionController(
          admissionUseCase: get<_i53.AdmissionUseCase>()));
  gh.factory<_i75.TicketCreateController>(() => _i75.TicketCreateController(
      ticketCreateUseCase: get<_i44.TicketCreateUseCase>(),
      ticketCategoriesUseCase: get<_i43.TicketCategoriesUseCase>()));
  gh.factory<_i76.TicketDetailsController>(() => _i76.TicketDetailsController(
      ticketDetailsUseCase: get<_i45.TicketDetailsUseCase>(),
      ticketReplyUseCase: get<_i46.TicketReplyUseCase>()));
  gh.factory<_i77.TicketsController>(
      () => _i77.TicketsController(ticketsUseCase: get<_i47.TicketsUseCase>()));
  gh.factory<_i78.TranscriptController>(() => _i78.TranscriptController(
      transcriptUseCase: get<_i48.TranscriptUseCase>()));
  gh.factory<_i79.AccessToMoodleController>(() => _i79.AccessToMoodleController(
      accessToMoodleUseCase: get<_i51.AccessToMoodleUseCase>()));
  gh.factory<_i80.AddCourseController>(() => _i80.AddCourseController(
      coursesAvailableUseCase: get<_i56.CoursesAvailableUseCase>(),
      addCoursesUseCase: get<_i52.AddCoursesUseCase>()));
  gh.factory<_i81.AttendanceController>(() => _i81.AttendanceController(
      attendanceUseCase: get<_i54.AttendanceUseCase>()));
  gh.factory<_i82.CourseRegisteredController>(() =>
      _i82.CourseRegisteredController(
          coursesRegisteredUseCase: get<_i57.CoursesRegisteredUseCase>(),
          removeCourseUseCase: get<_i71.RemoveCourseUseCase>()));
  gh.factory<_i83.FinanceController>(() => _i83.FinanceController(
      financeUseCase: get<_i60.FinanceUseCase>(),
      financePayUrlUseCase: get<_i59.FinancePayUrlUseCase>()));
  gh.factory<_i84.LectureTableController>(() => _i84.LectureTableController(
      lectureTableUseCase: get<_i64.LectureTableUseCase>()));
  gh.factory<_i85.LettersController>(
      () => _i85.LettersController(lettersUseCase: get<_i65.LettersUseCase>()));
  gh.factory<_i86.ScheduleController>(() =>
      _i86.ScheduleController(scheduleUseCase: get<_i73.ScheduleUseCase>()));
  return get;
}
