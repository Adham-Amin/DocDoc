part of 'appointment_cubit.dart';

sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

final class AppointmentLoading extends AppointmentState {}

final class AppointmentLoaded extends AppointmentState {
  final AppointmentEntity appointment;
  AppointmentLoaded({required this.appointment});
}

final class AppointmentError extends AppointmentState {
  final String message;
  AppointmentError({required this.message});
}
