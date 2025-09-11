import 'package:dartz/dartz.dart';
import 'package:docdoc/core/errors/failure.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';

abstract class SpecialityRepo {
  Future<Either<Failure, List<DoctorEntity>>> getSpecialityDoctors({
    required num specialityId,
  });
}
