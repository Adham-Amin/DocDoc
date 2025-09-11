import 'package:dio/dio.dart';
import 'package:docdoc/core/services/api_service.dart';
import 'package:docdoc/features/auth/data/models/auth_response/auth_response.dart';
import 'package:docdoc/features/auth/data/models/login_request/login_request.dart';
import 'package:docdoc/features/auth/data/models/register_request/register_request.dart';
import 'package:docdoc/features/auth/domain/entity/auth_entity.dart';

abstract class RemoteAuthDataSource {
  Future<AuthEntity> login({required LoginRequest data});
  Future<AuthEntity> register({required RegisterRequest data});
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final ApiService apiService;
  RemoteAuthDataSourceImpl({required this.apiService});

  @override
  Future<AuthEntity> login({required LoginRequest data}) async {
    FormData formData = FormData.fromMap(data.toJson());
    var response = await apiService.post(
      endPoint: '/auth/login',
      data: formData,
    );
    return AuthResponse.fromJson(response).toEntity();
  }

  @override
  Future<AuthEntity> register({required RegisterRequest data}) async {
    FormData formData = FormData.fromMap(data.toJson());
    var response = await apiService.post(
      endPoint: '/auth/register',
      data: formData,
    );
    return AuthResponse.fromJson(response).toEntity();
  }
}
