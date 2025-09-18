import 'package:dartz/dartz.dart';
import 'package:docdoc/core/errors/failure.dart';
import 'package:docdoc/features/my_appointment/domain/entities/my_appointment_entity.dart';

abstract class MyAppointmentRepo {
  Future<Either<Failure, List<MyAppointmentEntity>>> getMyAppointments();
}
