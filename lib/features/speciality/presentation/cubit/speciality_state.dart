part of 'speciality_cubit.dart';

sealed class SpecialityState {}

final class SpecialityInitial extends SpecialityState {}

final class SpecialityLoading extends SpecialityState {}

final class SpecialityLoaded extends SpecialityState {
  final List<DoctorEntity> doctors;
  SpecialityLoaded({required this.doctors});
}

final class SpecialityError extends SpecialityState {
  final String message;
  SpecialityError({required this.message});
}
