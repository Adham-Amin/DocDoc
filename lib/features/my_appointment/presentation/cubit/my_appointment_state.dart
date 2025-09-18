part of 'my_appointment_cubit.dart';

sealed class MyAppointmentState {}

final class MyAppointmentInitial extends MyAppointmentState {}

final class MyAppointmentLoading extends MyAppointmentState {}

final class MyAppointmentLoaded extends MyAppointmentState {
  final List<MyAppointmentEntity> myAppointments;
  MyAppointmentLoaded({required this.myAppointments});
}

final class MyAppointmentError extends MyAppointmentState {
  final String message;
  MyAppointmentError({required this.message});
}
