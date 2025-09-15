import 'package:docdoc/features/appointment/domain/entities/appointment_entity.dart';
import 'package:docdoc/features/appointment/domain/repos/appointment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit({required this.appointmentRepo})
    : super(AppointmentInitial());

  final AppointmentRepo appointmentRepo;

  Future<void> bookAppointment({
    required num doctorId,
    required String appointmentTime,
    required String notes,
  }) async {
    emit(AppointmentLoading());
    final result = await appointmentRepo.bookAppointment(
      doctorId: doctorId,
      appointmentTime: appointmentTime,
      notes: notes,
    );
    result.fold(
      (failure) => emit(AppointmentError(message: failure.message)),
      (appointment) => emit(AppointmentLoaded(appointment: appointment)),
    );
  }
}
