import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:deskly_app/features/auth/data/errors/firebase_auth_failure.dart';
import 'package:deskly_app/features/auth/domain/errors/social_auth_cancelled_failure.dart';
import 'package:deskly_app/features/auth/data/model/user_model.dart';
import 'package:deskly_app/features/auth/domain/enums/social_auth_type.dart';
import 'package:deskly_app/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl({required this._authRemoteDataSource});
  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      await _authRemoteDataSource.login(email: email, password: password);

      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure.fromAuthException(e));
    } catch (e) {
      return left(FirebaseAuthFailure("Oops! Something went wrong."));
    }
  }

  @override
  Future<Either<Failure, void>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      var data = await _authRemoteDataSource.register(
        email: email,
        password: password,
      );

      final UserModel user = UserModel(
        name: name,
        email: email,
        phone: phone,
        uId: data.user!.uid,
      );

      await _authRemoteDataSource.createUserDocument(user: user);

      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure.fromAuthException(e));
    } catch (e) {
      return left(FirebaseAuthFailure("Oops! Something went wrong."));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await _authRemoteDataSource.resetPassword(email: email);

      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure.fromAuthException(e));
    } catch (e) {
      return left(FirebaseAuthFailure("Oops! Something went wrong."));
    }
  }

  @override
  Future<Either<Failure, void>> socialAuthLogin({
    required SocialAuthType provider,
  }) async {
    try {
      final UserCredential credential;
      switch (provider) {
        case SocialAuthType.google:
          credential = await _authRemoteDataSource.loginWithGoogle();
          break;
        case SocialAuthType.facebook:
          final loginResult = await _authRemoteDataSource.loginWithFacebook();

          final failure = _handleLoginResultStatus(loginResult);
          if (failure != null) {
            return left(failure);
          }

          final String? token = loginResult.accessToken?.tokenString;

          if (token == null) {
            return left(FirebaseAuthFailure('Facebook access token is null'));
          }

          credential = await _authRemoteDataSource.loginWithFacebookCredential(token: token);
          break;
        case SocialAuthType.linkedin:
          return left(
            FirebaseAuthFailure('Login With Linkedin Not Available now'),
          );
      }

      final user = credential.user;

      if (user != null) {
        await _createUserDocumentIfNotExists(user: user);
      }

      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure.fromAuthException(e));
    } catch (e) {
      if (e is GoogleSignInException) {
        if (e.code == GoogleSignInExceptionCode.canceled) {
          return left(SocialAuthCancelledFailure());
        }
      }
      return left(FirebaseAuthFailure("Oops! Something went wrong."));
    }
  }

  Future<void> _createUserDocumentIfNotExists({required User user}) async {
    final bool exists = await _authRemoteDataSource.userDocumentExists(
      uId: user.uid,
    );

    if (exists) {
      return;
    }

    final userModel = UserModel(
      uId: user.uid,
      name: user.displayName ?? 'anonymously',
      email: user.email ?? '',
      phone: null,
    );

    await _authRemoteDataSource.createUserDocument(user: userModel);
  }

  Failure? _handleLoginResultStatus(LoginResult loginResult) {
    if (loginResult.status == LoginStatus.cancelled) {
      return SocialAuthCancelledFailure();
    }
    if (loginResult.status != LoginStatus.success) {
      return FirebaseAuthFailure(
        loginResult.message ?? 'Facebook login failed',
      );
    }
    return null;
  }
}
