part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterFailure extends AuthState {
  final String message;

  RegisterFailure({required this.message});
}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {
  final String message;

  LoginFailure({required this.message});
}

final class SocialAuthLoading extends AuthState {}

final class SocialAuthSuccess extends AuthState {}

final class SocialAuthFailure extends AuthState {
  final String message;

  SocialAuthFailure({required this.message});
}

final class SocialAuthCancelled extends AuthState {}

final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccess extends AuthState {}

final class ResetPasswordFailure extends AuthState {
  final String message;

  ResetPasswordFailure({required this.message});
}
