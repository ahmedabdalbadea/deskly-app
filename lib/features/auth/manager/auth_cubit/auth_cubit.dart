import 'package:bloc/bloc.dart';
import 'package:deskly_app/features/auth/domain/errors/social_auth_cancelled_failure.dart';
import 'package:deskly_app/features/auth/domain/enums/social_auth_type.dart';
import 'package:deskly_app/features/auth/domain/use_case/login/login_params.dart';
import 'package:deskly_app/features/auth/domain/use_case/login/login_use_case.dart';
import 'package:deskly_app/features/auth/domain/use_case/register/register_params.dart';
import 'package:deskly_app/features/auth/domain/use_case/register/register_use_case.dart';
import 'package:deskly_app/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:deskly_app/features/auth/domain/use_case/social_auth_use_case.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required RegisterUseCase registerUseCase,
    required LoginUseCase loginUseCase,
    required SocialAuthUseCase socialAuthUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
  }) : _registerUseCase = registerUseCase,
       _loginUseCase = loginUseCase,
       _socialAuthUseCase = socialAuthUseCase,
       _resetPasswordUseCase = resetPasswordUseCase,
       super(AuthInitial());

  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;
  final SocialAuthUseCase _socialAuthUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(RegisterLoading());

    var result = await _registerUseCase.call(
      RegisterParams(
        name: name,
        email: email,
        phone: phone,
        password: password,
      ),
    );

    result.fold(
      (failure) {
        emit(RegisterFailure(message: failure.message));
      },
      (_) {
        emit(RegisterSuccess());
      },
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    var result = await _loginUseCase.call(
      LoginParams(email: email, password: password),
    );

    result.fold(
      (failure) {
        emit(LoginFailure(message: failure.message));
      },
      (_) {
        emit(LoginSuccess());
      },
    );
  }

  Future<void> socialAuth({required SocialAuthType provider}) async {
    emit(SocialAuthLoading());

    var result = await _socialAuthUseCase.call(provider);

    result.fold(
      (failure) {
        if (failure is SocialAuthCancelledFailure) {
          emit(SocialAuthCancelled());
          return;
        }

        emit(SocialAuthFailure(message: failure.message));
      },
      (_) {
        emit(SocialAuthSuccess());
      },
    );
  }

  Future<void> resetPassword({required String email}) async {
    if (state is ResetPasswordLoading || state is ResetPasswordSuccess) {
      return;
    }

    emit(ResetPasswordLoading());

    var result = await _resetPasswordUseCase.call(email);

    result.fold(
      (failure) {
        emit(ResetPasswordFailure(message: failure.message));
      },
      (_) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
