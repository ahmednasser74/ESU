class LoginRequestModel {
  LoginRequestModel({
    required this.id,
    required this.password,
  });

  String id;
  String password;

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
      };
}
