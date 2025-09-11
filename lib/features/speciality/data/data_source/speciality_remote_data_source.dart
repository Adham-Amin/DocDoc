import 'package:docdoc/core/services/api_service.dart';
import 'package:docdoc/features/home/data/models/doctor_response/doctor_response.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';

abstract class SpecialityRemoteDataSource {
  Future<List<DoctorEntity>> getSpecialityDoctors({required num specialityId});
}

class SpecialityRemoteDataSourceImpl implements SpecialityRemoteDataSource {
  final ApiService apiService;
  SpecialityRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<DoctorEntity>> getSpecialityDoctors({
    required num specialityId,
  }) async {
    final response = await apiService.get(
      endPoint: '/specialization/show/$specialityId',
    );

    List<DoctorEntity> doctors = [];
    for (var doctor in response['data']['doctors']) {
      doctors.add(DoctorResponse.fromJson(doctor).toEntity());
    }

    return doctors;
  }
}
