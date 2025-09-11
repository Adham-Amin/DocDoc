import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  final HomeRepo homeRepo;
  late List<DoctorEntity> allDoctors;

  Future<void> getAllDoctors() async {
    emit(HomeLoading());
    var result = await homeRepo.getAllDoctors();
    result.fold(
      (failure) {
        emit(HomeError(message: failure.message));
      },
      (doctors) {
        allDoctors = doctors;
        emit(HomeLoaded(doctors: doctors));
      },
    );
  }
}
