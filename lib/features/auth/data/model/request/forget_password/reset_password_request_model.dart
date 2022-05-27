class ResetPasswordRequestModel {
  ResetPasswordRequestModel({
    required this.code,
    required this.password,
    required this.passwordConfirmation,
    required this.email,
  });

  final String code;
  final String password;
  final String passwordConfirmation;
  final String email;

  Map<String, dynamic> toJson() => {
        "code": code,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "email": email,
      };
}
