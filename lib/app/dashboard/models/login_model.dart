class LoginModel {
  final String employeeId;
  final String password;

  LoginModel({
    required this.employeeId,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "employeeId": employeeId,
      "password": password,
    };
  }
}
