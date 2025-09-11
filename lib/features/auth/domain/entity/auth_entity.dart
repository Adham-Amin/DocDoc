class AuthEntity {
  final String message;
  final String name;
  final String token;

  AuthEntity({required this.message, required this.name, required this.token});

  Map<String, dynamic> toJson() {
    return {'message': message, 'name': name, 'token': token};
  }

  factory AuthEntity.fromJson(Map<String, dynamic> json) {
    return AuthEntity(
      message: json['message'],
      name: json['name'],
      token: json['token'],
    );
  }
}
