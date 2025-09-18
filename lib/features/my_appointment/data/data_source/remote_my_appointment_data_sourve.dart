import 'package:docdoc/core/services/api_service.dart';
import 'package:docdoc/features/my_appointment/data/models/my_appointment_response/my_appointment_response.dart';
import 'package:docdoc/features/my_appointment/domain/entities/my_appointment_entity.dart';

abstract class RemoteMyAppointmentDataSource {
  Future<List<MyAppointmentEntity>> getMyAppointments();
}

class RemoteMyAppointmentDataSourveImpl
    implements RemoteMyAppointmentDataSource {
  final ApiService apiService;
  RemoteMyAppointmentDataSourveImpl({required this.apiService});

  @override
  Future<List<MyAppointmentEntity>> getMyAppointments() async {
    var response = await apiService.get(endPoint: '/appointment/index');
    return (response['data'] as List)
        .map((e) => MyAppointmentResponse.fromJson(e).toEntity())
        .toList();
  }
}
