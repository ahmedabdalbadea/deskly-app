import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/core/use_case/use_case.dart';
import 'package:deskly_app/features/auth/domain/repos/auth_repo.dart';

class ResetPasswordUseCase implements UseCase<void, String> {
  final AuthRepo _authRepo;

  ResetPasswordUseCase({required this._authRepo});
  @override
  Future<Either<Failure, void>> call(String email) {
    return _authRepo.resetPassword(email: email);
  }
}
