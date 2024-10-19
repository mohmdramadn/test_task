class LoginRequestBody {
  String phone;
  String password;

  LoginRequestBody({
    required this.phone,
    required this.password,
  });

  LoginRequestBody copyWith({
    String? phone,
    String? password,
  }) =>
      LoginRequestBody(
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) => LoginRequestBody(
    phone: json["phone"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": password,
  };
}
