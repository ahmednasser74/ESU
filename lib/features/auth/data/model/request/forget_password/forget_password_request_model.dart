class ForgetPasswordRequestModel {
  ForgetPasswordRequestModel({
    required this.email,
  });

  final String email;

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
