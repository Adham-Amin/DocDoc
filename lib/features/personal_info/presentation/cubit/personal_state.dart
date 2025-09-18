part of 'personal_cubit.dart';

sealed class PersonalState {}

final class PersonalInitial extends PersonalState {}

final class PersonalLoading extends PersonalState {}

final class PersonalLoaded extends PersonalState {}

final class PersonalError extends PersonalState {
  final String message;
  PersonalError({required this.message});
}
