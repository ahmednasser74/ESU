class LoginRequestModel {
  LoginRequestModel({
    required this.studentId,
    required this.password,
  });

  String studentId;
  String password;

  Map<String, dynamic> toJson() => {
        "id": studentId,
        "password": password,
      };
}
