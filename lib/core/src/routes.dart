import 'package:boilerplate/features/auth/presentation/screen/login_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/register_academic_information_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/register_file_uploads_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/register_personal_information_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/splash_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/submit_registration_screen.dart';
import 'package:boilerplate/features/home/presentation/screens/home_screen.dart';
import 'package:boilerplate/features/home/presentation/screens/letters_screen.dart';
import 'package:boilerplate/features/home/presentation/screens/notification_screen.dart';
import 'package:boilerplate/features/home/presentation/screens/profile_screen.dart';
import 'package:boilerplate/features/home/presentation/screens/setting_screen.dart';
import 'package:boilerplate/features/home/presentation/screens/transcript_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../features/home/presentation/screens/finance_screen.dart';

class Routes {
  static const String splashScreen = '/splashScreen',
      loginScreen = '/loginScreen',
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
      registerPersonalInfo = '/registerPersonalInfo';

  static List<GetPage> setScreens() {
    return <GetPage>[
      GetPage(name: splashScreen, page: () => SplashScreen()),
      GetPage(name: loginScreen, page: () => const LoginScreen()),
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
      GetPage(name: homeScreen, page: () => HomeScreen()),
      GetPage(name: transcriptScreen, page: () => const TranscriptScreen()),
      GetPage(name: financeScreen, page: () => const FinanceScreen()),
      GetPage(name: profileScreen, page: () => const ProfileScreen()),
      GetPage(name: lettersScreen, page: () => const LettersScreen()),
      GetPage(name: notificationScreen, page: () => const NotificationScreen()),
      GetPage(name: settingsScreen, page: () => const SettingScreen()),
    ];
  }
}
