import 'package:docdoc/features/auth/domain/entity/auth_entity.dart';

import 'data.dart';

class AuthResponse {
  String? message;
  Data? data;
  bool? status;
  int? code;

  AuthResponse({this.message, this.data, this.status, this.code});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    status: json['status'] as bool?,
    code: json['code'] as int?,
  );

  AuthEntity toEntity() => AuthEntity(
    message: message ?? '',
    name: data?.username ?? '',
    token: data?.token ?? '',
  );
}
