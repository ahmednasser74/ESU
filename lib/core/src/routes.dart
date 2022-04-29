import 'package:boilerplate/features/auth/presentation/screen/login_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/register_academic_information_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/register_file_uploads_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/register_personal_information_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/splash_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/submit_registration_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static const String splashScreen = '/splashScreen',
      loginScreen = '/loginScreen',
      registerAcademicInfo = '/registerAcademicInfo',
      registerFileUploadScreen = '/registerFileUploadScreen',
      submitRegistrationScreen = '/submitRegistrationScreen',
      registerPersonalInfo = '/registerPersonalInfo';

  static List<GetPage> setScreens() {
    return <GetPage>[
      GetPage(name: splashScreen, page: () => SplashScreen()),
      GetPage(name: loginScreen, page: () => LoginScreen()),
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
        page: () => SubmitRegistrationScreen(),
      ),
    ];
  }
}
