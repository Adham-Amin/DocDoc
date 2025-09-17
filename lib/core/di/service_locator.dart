import 'package:dio/dio.dart';
import 'package:docdoc/core/services/api_service.dart';
import 'package:docdoc/features/appointment/data/data_source/appointment_remote_data_source.dart';
import 'package:docdoc/features/appointment/data/repos/appointment_repo_impl.dart';
import 'package:docdoc/features/appointment/domain/repos/appointment_repo.dart';
import 'package:docdoc/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:docdoc/features/auth/data/repos/auth_repo_impl.dart';
import 'package:docdoc/features/auth/domain/repos/auth_repo.dart';
import 'package:docdoc/features/home/data/data_source/home_remote_data_source.dart';
import 'package:docdoc/features/home/data/repos/home_repo_impl.dart';
import 'package:docdoc/features/home/domain/repos/home_repo.dart';
import 'package:docdoc/features/search/data/data_source/remote_search_data_source.dart';
import 'package:docdoc/features/search/data/repo/search_repo_impl.dart';
import 'package:docdoc/features/search/domain/repo/search_repo.dart';
import 'package:docdoc/features/speciality/data/data_source/speciality_remote_data_source.dart';
import 'package:docdoc/features/speciality/data/repos/speciality_repo_impl.dart';
import 'package:docdoc/features/speciality/domain/repos/speciality_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> serverLocator() async {
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  getIt.registerLazySingleton<RemoteAuthDataSource>(
    () => RemoteAuthDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(remoteAuthDataSource: getIt<RemoteAuthDataSource>()),
  );

  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: getIt<HomeRemoteDataSource>()),
  );

  getIt.registerLazySingleton<SpecialityRemoteDataSource>(
    () => SpecialityRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<SpecialityRepo>(
    () => SpecialityRepoImpl(
      specialityRemoteDataSource: getIt<SpecialityRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<AppointmentRemoteDataSource>(
    () => AppointmentRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<AppointmentRepo>(
    () => AppointmentRepoImpl(
      appointmentRemoteDataSource: getIt<AppointmentRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<RemoteSearchDataSource>(
    () => RemoteSearchDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<SearchRepo>(
    () =>
        SearchRepoImpl(remoteSearchDataSource: getIt<RemoteSearchDataSource>()),
  );
}
