import 'package:docdoc/core/services/api_service.dart';
import 'package:docdoc/features/home/data/models/doctor_response/doctor_response.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';

abstract class RemoteSearchDataSource {
  Future<List<DoctorEntity>> search({required String query});
}

class RemoteSearchDataSourceImpl implements RemoteSearchDataSource {
  final ApiService apiService;
  RemoteSearchDataSourceImpl({required this.apiService});
  @override
  Future<List<DoctorEntity>> search({required String query}) async {
    final response = await apiService.get(
      endPoint: '/doctor/doctor-search?name=$query',
    );

    List<DoctorEntity> doctors = [];
    for (var doctor in response['data']) {
      doctors.add(DoctorResponse.fromJson(doctor).toEntity());
    }

    return doctors;
  }
}
