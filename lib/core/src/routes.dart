import 'package:esu/features/auth/presentation/screen/forget_password_screen.dart';
import 'package:esu/features/auth/presentation/screen/login_screen.dart';
import 'package:esu/features/auth/presentation/screen/map_screen.dart';
import 'package:esu/features/auth/presentation/screen/register_academic_information_screen.dart';
import 'package:esu/features/auth/presentation/screen/register_file_uploads_screen.dart';
import 'package:esu/features/auth/presentation/screen/register_personal_information_screen.dart';
import 'package:esu/features/auth/presentation/screen/reset_password_screen.dart';
import 'package:esu/features/auth/presentation/screen/splash_screen.dart';
import 'package:esu/features/auth/presentation/screen/submit_registration_screen.dart';
import 'package:esu/features/auth/presentation/screen/successful_admission_screen.dart';
import 'package:esu/features/home/presentation/screens/home_screen.dart';
import 'package:esu/features/home/presentation/screens/notification_screen.dart';
import 'package:esu/features/home/presentation/screens/popular_question_screen.dart';
import 'package:esu/features/home/presentation/screens/profile_screen.dart';
import 'package:esu/features/home/presentation/screens/setting_screen.dart';
import 'package:esu/features/student_actions/presentation/screen/add_course_screen.dart';
import 'package:esu/features/student_actions/presentation/screen/courses_registered_screen.dart';
import 'package:esu/features/student_actions/presentation/screen/term_registration_screen.dart';
import 'package:esu/features/student_actions/presentation/screen/ticket_create_screen.dart';
import 'package:esu/features/student_actions/presentation/screen/ticket_details_screen.dart';
import 'package:esu/features/student_actions/presentation/screen/ticket_screen.dart';
import 'package:esu/features/student_data/presentation/screen/access_to_moodle_screen.dart';
import 'package:esu/features/student_data/presentation/screen/attendance_screen.dart';
import 'package:esu/features/student_data/presentation/screen/lecture_table_screen.dart';
import 'package:esu/features/student_data/presentation/screen/letters_screen.dart';
import 'package:esu/features/student_data/presentation/screen/schedule_screen.dart';
import 'package:esu/features/student_data/presentation/screen/student_card_screen.dart';
import 'package:esu/features/student_data/presentation/screen/study_plans_screen.dart';
import 'package:esu/features/student_data/presentation/screen/transcript_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../features/student_data/presentation/screen/finance_screen.dart';

class Routes {
  static const String splashScreen = '/splashScreen',
      loginScreen = '/loginScreen',
      forgetPasswordScreen = '/forgetPasswordScreen',
      resetPasswordScreen = '/resetPasswordScreen',
      registerAcademicInfo = '/registerAcademicInfo',
      registerFileUploadScreen = '/registerFileUploadScreen',
      submitRegistrationScreen = '/submitRegistrationScreen',
      registerPersonalInfo = '/registerPersonalInfo',
      homeScreen = '/homeScreen',
      financeScreen = '/financeScreen',
      notificationScreen = '/notificationScreen',
      profileScreen = '/profileScreen',
      lettersScreen = '/lettersScreen',
      transcriptScreen = '/transcriptScreen',
      settingsScreen = '/settingsScreen',
      successfulAdmissionScreen = '/successfulAdmissionScreen',
      studyPlanScreen = '/studyPlanScreen',
      studentCardScreen = '/studentCardScreen',
      termRegistrationScreen = '/termRegistrationScreen',
      popularQuestionScreen = '/popularQuestionScreen',
      scheduleScreen = '/scheduleScreen',
      accessToMoodleScreen = '/accessToMoodleScreen',
      lectureTableScreen = '/lectureTableScreen',
      coursesRegisteredScreen = '/coursesRegisteredScreen',
      addCourseScreen = '/addCourseScreen',
      ticketCreateScreen = '/ticketCreateScreen',
      ticketDetailsScreen = '/ticketDetailsScreen',
      attendanceScreen = '/attendanceScreen',
      mapScreen = '/mapScreen',
      ticketsScreen = '/ticketsScreen';

  static List<GetPage> setScreens() {
    return <GetPage>[
      GetPage(name: splashScreen, page: () => const SplashScreen()),
      GetPage(name: loginScreen, page: () => const LoginScreen()),
      GetPage(
        name: forgetPasswordScreen,
        page: () => const ForgetPasswordScreen(),
      ),
      GetPage(
        name: resetPasswordScreen,
        page: () => const ResetPasswordScreen(),
      ),
      GetPage(
        name: registerAcademicInfo,
        page: () => const RegisterAcademicInfoScreen(),
      ),
      GetPage(
        name: registerPersonalInfo,
        page: () => RegisterPersonalInfoScreen(),
      ),
      GetPage(
        name: registerFileUploadScreen,
        page: () => RegisterFileUploadsScreen(),
      ),
      GetPage(
        name: submitRegistrationScreen,
        page: () => const SubmitRegistrationScreen(),
      ),
      GetPage(
        name: popularQuestionScreen,
        page: () => const PopularQuestionScreen(),
      ),
      GetPage(name: homeScreen, page: () => HomeScreen()),
      GetPage(name: transcriptScreen, page: () => const TranscriptScreen()),
      GetPage(name: financeScreen, page: () => const FinanceScreen()),
      GetPage(name: profileScreen, page: () => const ProfileScreen()),
      GetPage(name: lettersScreen, page: () => const LettersScreen()),
      GetPage(name: notificationScreen, page: () => const NotificationScreen()),
      GetPage(name: settingsScreen, page: () => const SettingScreen()),
      GetPage(name: scheduleScreen, page: () => const ScheduleScreen()),
      GetPage(name: studyPlanScreen, page: () => const StudyPlansScreen()),
      GetPage(name: studentCardScreen, page: () => const StudentCardScreen()),
      GetPage(
        name: termRegistrationScreen,
        page: () => const TermRegistrationScreen(),
      ),
      GetPage(
        name: accessToMoodleScreen,
        page: () => const AccessToMoodleScreen(),
      ),
      GetPage(name: lectureTableScreen, page: () => const LectureTableScreen()),
      GetPage(
        name: successfulAdmissionScreen,
        page: () => const SuccessfulAdmissionScreen(),
      ),
      GetPage(name: ticketsScreen, page: () => const TicketsScreen()),
      GetPage(
        name: ticketDetailsScreen,
        page: () => const TicketDetailsScreen(),
      ),
      GetPage(name: ticketCreateScreen, page: () => const TicketCreateScreen()),
      GetPage(
        name: coursesRegisteredScreen,
        page: () => const CourseRegisteredScreen(),
      ),
      GetPage(name: addCourseScreen, page: () => const AddCourseScreen()),
      GetPage(name: attendanceScreen, page: () => const AttendanceScreen()),
      GetPage(name: mapScreen, page: () => const MapScreen()),
    ];
  }
}
