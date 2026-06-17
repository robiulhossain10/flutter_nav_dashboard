class LoginModel {
  String? email;
  String? password;

  LoginModel({this.email, this.password});

  // জেলাইজেশন (API-তে ডেটা পাঠানোর জন্য)
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
