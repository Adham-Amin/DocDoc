part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterLoaded extends RegisterState {
  final AuthEntity user;
  RegisterLoaded({required this.user});
}

final class RegisterError extends RegisterState {
  final String message;
  RegisterError({required this.message});
}
