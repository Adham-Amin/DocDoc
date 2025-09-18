import 'package:docdoc/features/personal_info/data/models/personal_request.dart';
import 'package:docdoc/features/personal_info/domain/repo/personal_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'personal_state.dart';

class PersonalCubit extends Cubit<PersonalState> {
  PersonalCubit({required this.personalRepo}) : super(PersonalInitial());

  final PersonalRepo personalRepo;

  Future<void> updatePersonalInfo({
    required PersonalRequest personalRequest,
  }) async {
    emit(PersonalLoading());
    final result = await personalRepo.updatePersonalInfo(
      personalRequest: personalRequest,
    );
    result.fold(
      (failure) => emit(PersonalError(message: failure.message)),
      (r) => emit(PersonalLoaded()),
    );
  }
}
