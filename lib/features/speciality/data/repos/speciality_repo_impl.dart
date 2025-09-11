import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/core/errors/failure.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/speciality/data/data_source/speciality_remote_data_source.dart';
import 'package:docdoc/features/speciality/domain/repos/speciality_repo.dart';

class SpecialityRepoImpl extends SpecialityRepo {
  final SpecialityRemoteDataSource specialityRemoteDataSource;
  SpecialityRepoImpl({required this.specialityRemoteDataSource});

  @override
  Future<Either<Failure, List<DoctorEntity>>> getSpecialityDoctors({
    required num specialityId,
  }) async {
    try {
      var data = await specialityRemoteDataSource.getSpecialityDoctors(
        specialityId: specialityId,
      );
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
