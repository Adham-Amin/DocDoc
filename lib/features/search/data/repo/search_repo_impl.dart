import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/core/errors/failure.dart';
import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/search/data/data_source/remote_search_data_source.dart';
import 'package:docdoc/features/search/domain/repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final RemoteSearchDataSource remoteSearchDataSource;
  SearchRepoImpl({required this.remoteSearchDataSource});

  @override
  Future<Either<Failure, List<DoctorEntity>>> search({
    required String query,
  }) async {
    try {
      final data = await remoteSearchDataSource.search(query: query);
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
