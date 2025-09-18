import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/core/errors/failure.dart';
import 'package:docdoc/features/my_appointment/data/data_source/remote_my_appointment_data_sourve.dart';
import 'package:docdoc/features/my_appointment/domain/entities/my_appointment_entity.dart';
import 'package:docdoc/features/my_appointment/domain/repo/my_appointment_repo.dart';

class MyAppointmentRepoImpl extends MyAppointmentRepo {
  final RemoteMyAppointmentDataSource remoteMyAppointmentDataSource;
  MyAppointmentRepoImpl({required this.remoteMyAppointmentDataSource});

  @override
  Future<Either<Failure, List<MyAppointmentEntity>>> getMyAppointments() async {
    try {
      final data = await remoteMyAppointmentDataSource.getMyAppointments();
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
