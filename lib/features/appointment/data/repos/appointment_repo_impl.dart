import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/core/errors/failure.dart';
import 'package:docdoc/features/appointment/data/data_source/appointment_remote_data_source.dart';
import 'package:docdoc/features/appointment/domain/entities/appointment_entity.dart';
import 'package:docdoc/features/appointment/domain/repos/appointment_repo.dart';

class AppointmentRepoImpl extends AppointmentRepo {
  final AppointmentRemoteDataSource appointmentRemoteDataSource;
  AppointmentRepoImpl({required this.appointmentRemoteDataSource});

  @override
  Future<Either<Failure, AppointmentEntity>> bookAppointment({
    required num doctorId,
    required String appointmentTime,
    required String notes,
  }) async {
    try {
      var data = await appointmentRemoteDataSource.bookAppointment(
        doctorId: doctorId,
        appointmentTime: appointmentTime,
        notes: notes,
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
