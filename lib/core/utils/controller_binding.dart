import 'package:esu/core/dio/dio_request_handling.dart';
import 'package:esu/core/localization/translation_controller.dart';
import 'package:esu/features/auth/presentation/controller/academic_info_controller.dart';
import 'package:esu/features/auth/presentation/controller/forget_password_controller.dart';
import 'package:esu/features/auth/presentation/controller/login_controller.dart';
import 'package:esu/features/auth/presentation/controller/personal_info_controller.dart';
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

import 'di.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    //-----------------------------------------------------------------------
    ///core
    Get.lazyPut(
      () => Injection.di<DioRequestHandlingController>(),
      fenix: true,
    );
    Get.lazyPut(() => Injection.di<TranslationController>(), fenix: true);
    //-----------------------------------------------------------------------
    ///auth
    Get.lazyPut(() => Injection.di<SplashController>(), fenix: true);
    Get.lazyPut(() => Injection.di<LoginController>(), fenix: true);
    Get.lazyPut(() => Injection.di<ForgetPasswordController>(), fenix: true);
    Get.lazyPut(() => Injection.di<ResetPasswordController>(), fenix: true);
    Get.lazyPut(() => Injection.di<SubmitAdmissionController>(), fenix: true);
    Get.lazyPut(() => Injection.di<AcademicInfoController>(), fenix: true);
    Get.lazyPut(() => Injection.di<PersonalInfoController>(), fenix: true);
    //-----------------------------------------------------------------------
    ///home
    Get.lazyPut(() => Injection.di<ProfileController>(), fenix: true);
    Get.lazyPut(() => Injection.di<SettingController>(), fenix: true);
    Get.lazyPut(() => Injection.di<NotificationController>(), fenix: true);
    Get.lazyPut(() => Injection.di<HomeController>(), fenix: true);
    Get.lazyPut(() => Injection.di<PopularQuestionController>(), fenix: true);
    Get.lazyPut(() => Injection.di<LogoutController>(), fenix: true);
    //-----------------------------------------------------------------------
    ///student data
    Get.lazyPut(() => Injection.di<LettersController>(), fenix: true);
    Get.lazyPut(() => Injection.di<TranscriptController>(), fenix: true);
    Get.lazyPut(() => Injection.di<FinanceController>(), fenix: true);
    Get.lazyPut(() => Injection.di<StudyPlansController>(), fenix: true);
    Get.lazyPut(() => Injection.di<ScheduleController>(), fenix: true);
    Get.lazyPut(() => Injection.di<AccessToMoodleController>(), fenix: true);
    Get.lazyPut(() => Injection.di<LectureTableController>(), fenix: true);
    //-----------------------------------------------------------------------
    ///student actions
    Get.lazyPut(() => Injection.di<TermRegistrationController>(), fenix: true);
    Get.lazyPut(() => Injection.di<TicketCreateController>(), fenix: true);
    Get.lazyPut(() => Injection.di<TicketsController>(), fenix: true);
    Get.lazyPut(() => Injection.di<TicketDetailsController>(), fenix: true);
    Get.lazyPut(() => Injection.di<CourseRegisteredController>(), fenix: true);
    Get.lazyPut(() => Injection.di<AddCourseController>(), fenix: true);
    Get.lazyPut(() => Injection.di<AttendanceController>(), fenix: true);
  }
}
