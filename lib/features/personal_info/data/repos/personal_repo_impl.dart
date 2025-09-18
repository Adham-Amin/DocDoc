import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/core/errors/failure.dart';
import 'package:docdoc/features/personal_info/data/data_source/remote_personal_data_source.dart';
import 'package:docdoc/features/personal_info/data/models/personal_request.dart';
import 'package:docdoc/features/personal_info/domain/repo/personal_repo.dart';

class PersonalRepoImpl extends PersonalRepo {
  final RemotePersonalDataSource personalDataSource;
  PersonalRepoImpl({required this.personalDataSource});
  @override
  Future<Either<Failure, void>> updatePersonalInfo({
    required PersonalRequest personalRequest,
  }) async {
    try {
      await personalDataSource.updatePersonalInfo(
        personalRequest: personalRequest,
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
