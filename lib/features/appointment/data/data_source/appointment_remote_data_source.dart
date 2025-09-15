import 'package:dio/dio.dart';
import 'package:docdoc/core/services/api_service.dart';
import 'package:docdoc/features/appointment/data/models/appointment_response/appointment_response.dart';
import 'package:docdoc/features/appointment/domain/entities/appointment_entity.dart';

abstract class AppointmentRemoteDataSource {
  Future<AppointmentEntity> bookAppointment({
    required num doctorId,
    required String appointmentTime,
    required String notes,
  });
}

class AppointmentRemoteDataSourceImpl implements AppointmentRemoteDataSource {
  final ApiService apiService;
  AppointmentRemoteDataSourceImpl({required this.apiService});

  @override
  Future<AppointmentEntity> bookAppointment({
    required num doctorId,
    required String appointmentTime,
    required String notes,
  }) async {
    var formData = FormData.fromMap({
      'doctor_id': doctorId,
      'start_time': appointmentTime,
      'notes': notes,
    });

    final response = await apiService.post(
      endPoint: '/appointment/store',
      data: formData,
    );

    return AppointmentResponse.fromJson(response['data']).toEntity();
  }
}
