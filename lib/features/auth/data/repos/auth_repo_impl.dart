import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/core/errors/failure.dart';
import 'package:docdoc/core/services/shared_preferences_service.dart';
import 'package:docdoc/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:docdoc/features/auth/data/models/login_request/login_request.dart';
import 'package:docdoc/features/auth/data/models/register_request/register_request.dart';
import 'package:docdoc/features/auth/domain/entity/auth_entity.dart';
import 'package:docdoc/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final RemoteAuthDataSource remoteAuthDataSource;
  AuthRepoImpl({required this.remoteAuthDataSource});

  @override
  Future<Either<Failure, AuthEntity>> login({
    required LoginRequest data,
  }) async {
    try {
      final userData = await remoteAuthDataSource.login(data: data);
      savedUserData(userData);
      return Right(userData);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> register({
    required RegisterRequest data,
  }) async {
    try {
      final userData = await remoteAuthDataSource.register(data: data);
      savedUserData(userData);
      return Right(userData);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  void savedUserData(AuthEntity userData) async {
    await Prefs.setUser(userData);
    await Prefs.setToken(userData.token);
  }
}
