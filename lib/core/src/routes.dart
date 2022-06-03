import 'package:boilerplate/features/auth/presentation/screen/forget_password_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/login_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/register_academic_information_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/register_file_uploads_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/register_personal_information_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/reset_password_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/splash_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/submit_registration_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/successful_admission_screen.dart';
import 'package:boilerplate/features/home/presentation/screens/home_screen.dart';
import 'package:boilerplate/features/home/presentation/screens/notification_screen.dart';
import 'package:boilerplate/features/home/presentation/screens/popular_question_screen.dart';
import 'package:boilerplate/features/home/presentation/screens/profile_screen.dart';
import 'package:boilerplate/features/home/presentation/screens/setting_screen.dart';
import 'package:boilerplate/features/student_data/presentation/screen/access_to_moodle_screen.dart';
import 'package:boilerplate/features/student_data/presentation/screen/lecture_table_screen.dart';
import 'package:boilerplate/features/student_data/presentation/screen/letters_screen.dart';
import 'package:boilerplate/features/student_data/presentation/screen/schedule_screen.dart';
import 'package:boilerplate/features/student_data/presentation/screen/student_card_screen.dart';
import 'package:boilerplate/features/student_data/presentation/screen/study_plans_screen.dart';
import 'package:boilerplate/features/student_data/presentation/screen/transcript_screen.dart';
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
      popularQuestionScreen = '/popularQuestionScreen',
      scheduleScreen = '/scheduleScreen',
      accessToMoodleScreen = '/accessToMoodleScreen',
      lectureTableScreen = '/lectureTableScreen',
      registerPersonalInfo = '/registerPersonalInfo';

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
        name: accessToMoodleScreen,
        page: () => const AccessToMoodleScreen(),
      ),
      GetPage(name: lectureTableScreen, page: () => const LectureTableScreen()),
      GetPage(
        name: successfulAdmissionScreen,
        page: () => const SuccessfulAdmissionScreen(),
      ),
    ];
  }
}
