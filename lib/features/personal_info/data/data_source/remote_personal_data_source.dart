import 'package:dio/dio.dart';
import 'package:docdoc/core/services/api_service.dart';
import 'package:docdoc/features/personal_info/data/models/personal_request.dart';

abstract class RemotePersonalDataSource {
  Future<void> updatePersonalInfo({required PersonalRequest personalRequest});
}

class RemotePersonalDataSourceImpl implements RemotePersonalDataSource {
  final ApiService apiService;
  RemotePersonalDataSourceImpl({required this.apiService});
  @override
  Future<void> updatePersonalInfo({
    required PersonalRequest personalRequest,
  }) async {
    var formData = FormData.fromMap(personalRequest.toMap());
    await apiService.post(endPoint: '/user/update', data: formData);
  }
}
