import 'package:docdoc/features/my_appointment/domain/entities/my_appointment_entity.dart';
import 'package:docdoc/features/my_appointment/domain/repo/my_appointment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_appointment_state.dart';

class MyAppointmentCubit extends Cubit<MyAppointmentState> {
  MyAppointmentCubit({required this.myAppointmentRepo})
    : super(MyAppointmentInitial());

  final MyAppointmentRepo myAppointmentRepo;

  Future<void> getMyAppointments() async {
    emit(MyAppointmentLoading());
    final result = await myAppointmentRepo.getMyAppointments();
    result.fold(
      (l) => emit(MyAppointmentError(message: l.message)),
      (r) => emit(MyAppointmentLoaded(myAppointments: r)),
    );
  }
}
