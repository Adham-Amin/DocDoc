import 'package:docdoc/features/auth/data/models/login_request/login_request.dart';
import 'package:docdoc/features/auth/domain/entity/auth_entity.dart';
import 'package:docdoc/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> login({required LoginRequest data}) async {
    emit(LoginLoading());
    final result = await authRepo.login(data: data);
    result.fold(
      (failure) => emit(LoginError(message: failure.message)),
      (user) => emit(LoginLoaded(user: user)),
    );
  }
}
