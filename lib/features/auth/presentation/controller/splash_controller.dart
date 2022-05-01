import 'package:boilerplate/features/auth/domin/usecases/is_user_login_use_case.dart';
import 'package:boilerplate/features/auth/presentation/screen/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final IsUserLoginUseCase isUserLoginUseCase;

  SplashController({required this.isUserLoginUseCase});

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: 1),
      () => Get.off(() => const LoginScreen()),
    );
  }

  void splashNavigation() async {
    // final isUserLogin = await isUserLoginUseCase(params: NoParams());
    // if (isUserLogin)
    //   navigate to homeScreen
    // Get.offNamed('');
    // else
    //navigate to loginScreen
    Get.off(const LoginScreen());
  }
}
