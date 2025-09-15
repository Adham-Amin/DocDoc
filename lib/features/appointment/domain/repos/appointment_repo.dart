import 'package:dartz/dartz.dart';
import 'package:docdoc/core/errors/failure.dart';
import 'package:docdoc/features/appointment/domain/entities/appointment_entity.dart';

abstract class AppointmentRepo {
  Future<Either<Failure, AppointmentEntity>> bookAppointment({
    required num doctorId,
    required String appointmentTime,
    required String notes,
  });
}
