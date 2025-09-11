import 'package:docdoc/features/auth/data/models/register_request/register_request.dart';
import 'package:docdoc/features/auth/domain/entity/auth_entity.dart';
import 'package:docdoc/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authRepo}) : super(RegisterInitial());

  final AuthRepo authRepo;

  Future<void> register({required RegisterRequest data}) async {
    emit(RegisterLoading());
    final result = await authRepo.register(data: data);
    result.fold(
      (failure) => emit(RegisterError(message: failure.message)),
      (user) => emit(RegisterLoaded(user: user)),
    );
  }
}
