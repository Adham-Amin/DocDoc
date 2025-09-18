class PersonalRequest {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String password;
  final String confirmPassword;

  PersonalRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'password': password,
      'password_confirmation': confirmPassword,
    };
  }
}
