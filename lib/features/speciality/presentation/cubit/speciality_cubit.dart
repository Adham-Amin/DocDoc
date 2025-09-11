import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/speciality/domain/repos/speciality_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'speciality_state.dart';

class SpecialityCubit extends Cubit<SpecialityState> {
  SpecialityCubit({required this.specialityRepo}) : super(SpecialityInitial());

  final SpecialityRepo specialityRepo;

  Future<void> getSpecialityDoctors({required num specialityId}) async {
    emit(SpecialityLoading());
    final result = await specialityRepo.getSpecialityDoctors(
      specialityId: specialityId,
    );
    result.fold((l) => emit(SpecialityError(message: l.message)), (doctors) {
      emit(SpecialityLoaded(doctors: doctors));
    });
  }
}
