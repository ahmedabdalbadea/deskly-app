import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/features/auth/domain/enums/social_auth_type.dart';

abstract class AuthRepo {
  /*
   * check first login / register => Splash
   * register use email and password 
   * login use email and password 
   * login use social auth
   * reset password
   */

  Future<Either<Failure, void>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  });
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> socialAuthLogin({
    required SocialAuthType provider,
  });

  Future<Either<Failure, void>> resetPassword({required String email});
}
