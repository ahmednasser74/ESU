import 'package:esu/core/dio/dio_request_handling.dart';
import 'package:esu/core/localization/translation_controller.dart';
import 'package:esu/core/src/theme/theme_controller.dart';
import 'package:esu/features/auth/presentation/controller/academic_info_controller.dart';
import 'package:esu/features/auth/presentation/controller/forget_password_controller.dart';
import 'package:esu/features/auth/presentation/controller/login_controller.dart';
import 'package:esu/features/auth/presentation/controller/register_personal_info_controller.dart';
import 'package:esu/features/auth/presentation/controller/reset_password_controller.dart';
import 'package:esu/features/auth/presentation/controller/splash_controller.dart';
import 'package:esu/features/auth/presentation/controller/submit_admission_controller.dart';
import 'package:esu/features/home/presentation/controller/home_controller.dart';
import 'package:esu/features/home/presentation/controller/logout_controler_controller.dart';
import 'package:esu/features/home/presentation/controller/notification_controller.dart';
import 'package:esu/features/home/presentation/controller/popular_question_controller.dart';
import 'package:esu/features/home/presentation/controller/profile_controller.dart';
import 'package:esu/features/home/presentation/controller/setting_controller.dart';
import 'package:esu/features/student_actions/presentation/controller/add_course_controller.dart';
import 'package:esu/features/student_actions/presentation/controller/courses_registered_controller.dart';
import 'package:esu/features/student_actions/presentation/controller/term_registration_controller.dart';
import 'package:esu/features/student_actions/presentation/controller/ticket_controller.dart';
import 'package:esu/features/student_actions/presentation/controller/ticket_create_controller.dart';
import 'package:esu/features/student_actions/presentation/controller/ticket_details_controller.dart';
import 'package:esu/features/student_data/presentation/controller/access_to_moodle_controller.dart';
import 'package:esu/features/student_data/presentation/controller/attendance_controller.dart';
import 'package:esu/features/student_data/presentation/controller/finance_controller.dart';
import 'package:esu/features/student_data/presentation/controller/lecture_table_controller.dart';
import 'package:esu/features/student_data/presentation/controller/letters_controller.dart';
import 'package:esu/features/student_data/presentation/controller/schedule_controller.dart';
import 'package:esu/features/student_data/presentation/controller/study_plans_controller.dart';
import 'package:esu/features/student_data/presentation/controller/transcript_controller.dart';
import 'package:get/get.dart';

import '../../features/home/presentation/controller/moodle_login_controller.dart';
import '../dependencies/dependency_init.dart';
import 'di.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    //-----------------------------------------------------------------------
    ///core
    Get.lazyPut(() => di<DioRequestHandlingController>(), fenix: true);
    Get.lazyPut(() => di<TranslationController>(), fenix: true);
    Get.lazyPut(() => di<ThemeController>(), fenix: true);
    //-----------------------------------------------------------------------
    ///auth
    Get.lazyPut(() => di<SplashController>(), fenix: true);
    Get.lazyPut(() => di<LoginController>(), fenix: true);
    Get.lazyPut(() => di<ForgetPasswordController>(), fenix: true);
    Get.lazyPut(() => di<ResetPasswordController>(), fenix: true);
    Get.lazyPut(() => di<SubmitAdmissionController>(), fenix: true);
    Get.lazyPut(() => di<AcademicInfoController>(), fenix: true);
    Get.lazyPut(() => di<RegisterPersonalInfoController>(), fenix: true);
    //-----------------------------------------------------------------------
    ///home
    Get.lazyPut(() => di<ProfileController>(), fenix: true);
    Get.lazyPut(() => di<SettingController>(), fenix: true);
    Get.lazyPut(() => di<NotificationController>(), fenix: true);
    Get.lazyPut(() => di<HomeController>(), fenix: true);
    Get.lazyPut(() => di<PopularQuestionController>(), fenix: true);
    Get.lazyPut(() => di<LogoutController>(), fenix: true);
    Get.lazyPut(() => di<MoodleLoginController>(), fenix: true);
    //-----------------------------------------------------------------------
    ///student data
    Get.lazyPut(() => di<LettersController>(), fenix: true);
    Get.lazyPut(() => di<TranscriptController>(), fenix: true);
    Get.lazyPut(() => di<FinanceController>(), fenix: true);
    Get.lazyPut(() => di<StudyPlansController>(), fenix: true);
    Get.lazyPut(() => di<ScheduleController>(), fenix: true);
    Get.lazyPut(() => di<AccessToMoodleController>(), fenix: true);
    Get.lazyPut(() => di<LectureTableController>(), fenix: true);
    //-----------------------------------------------------------------------
    ///student actions
    Get.lazyPut(() => di<TermRegistrationController>(), fenix: true);
    Get.lazyPut(() => di<TicketCreateController>(), fenix: true);
    Get.lazyPut(() => di<TicketsController>(), fenix: true);
    Get.lazyPut(() => di<TicketDetailsController>(), fenix: true);
    Get.lazyPut(() => di<CourseRegisteredController>(), fenix: true);
    Get.lazyPut(() => di<AddCourseController>(), fenix: true);
    Get.lazyPut(() => di<AttendanceController>(), fenix: true);
  }
}
