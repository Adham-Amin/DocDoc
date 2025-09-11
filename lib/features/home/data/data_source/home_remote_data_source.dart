import 'package:docdoc/core/services/api_service.dart';
import 'package:docdoc/features/home/data/models/doctor_response/doctor_response.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<DoctorEntity>> getAllDoctor();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<DoctorEntity>> getAllDoctor() async {
    final response = await apiService.get(endPoint: '/doctor/index');
    List<DoctorEntity> doctors = [];

    for (var doctor in response['data']) {
      doctors.add(DoctorResponse.fromJson(doctor).toEntity());
    }

    return doctors;
  }
}
