class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final int gender;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      'phone': phone,
      'gender': gender,
    };
  }
}
