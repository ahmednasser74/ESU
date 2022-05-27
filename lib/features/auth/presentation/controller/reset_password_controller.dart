import 'package:boilerplate/features/auth/domin/usecases/reset_password_usecase.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ResetPasswordController extends GetxController {
  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordController({
    required this.resetPasswordUseCase,
  });
}
