import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/core/use_case/use_case.dart';
import 'package:deskly_app/features/auth/domain/enums/social_auth_type.dart';
import 'package:deskly_app/features/auth/domain/repos/auth_repo.dart';

class SocialAuthUseCase implements UseCase<void, SocialAuthType> {
  final AuthRepo _authRepo;

  SocialAuthUseCase({required this._authRepo});
  @override
  Future<Either<Failure, void>> call(SocialAuthType provider) {
    return _authRepo.socialAuthLogin(provider: provider);
  }
}
