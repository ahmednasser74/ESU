import 'package:esu/features/auth/data/model/response/login/login_response_model.dart';

abstract class IUserPreferences {
  void saveUserPreference({required LoginResponseModel loginModel});

  LoginResponseModel? getUserPreference();

  String? getUserTokenPreference();

  void clearUserPreference();
}
