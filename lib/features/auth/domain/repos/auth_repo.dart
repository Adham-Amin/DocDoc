import 'package:dartz/dartz.dart';
import 'package:docdoc/core/errors/failure.dart';
import 'package:docdoc/features/auth/data/models/login_request/login_request.dart';
import 'package:docdoc/features/auth/data/models/register_request/register_request.dart';
import 'package:docdoc/features/auth/domain/entity/auth_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthEntity>> login({required LoginRequest data});
  Future<Either<Failure, AuthEntity>> register({required RegisterRequest data});
}
