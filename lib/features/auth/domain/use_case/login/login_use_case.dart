import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/core/use_case/use_case.dart';
import 'package:deskly_app/features/auth/domain/repos/auth_repo.dart';
import 'package:deskly_app/features/auth/domain/use_case/login/login_params.dart';

class LoginUseCase implements UseCase<void, LoginParams> {
  final AuthRepo _authRepo;

  LoginUseCase({required this._authRepo});
  @override
  Future<Either<Failure, void>> call(LoginParams param) =>
      _authRepo.login(email: param.email, password: param.password);
}
