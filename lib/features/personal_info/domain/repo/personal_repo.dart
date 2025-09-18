import 'package:dartz/dartz.dart';
import 'package:docdoc/core/errors/failure.dart';
import 'package:docdoc/features/personal_info/data/models/personal_request.dart';

abstract class PersonalRepo {
  Future<Either<Failure, void>> updatePersonalInfo({
    required PersonalRequest personalRequest,
  });
}
