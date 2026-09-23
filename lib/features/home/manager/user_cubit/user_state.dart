part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final UserEntity user;
  UserLoaded(this.user);
}

final class UserError extends UserState {
  final String errorMessage;
  UserError(this.errorMessage);
}
