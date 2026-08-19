import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/core/use_case/use_case.dart';
import 'package:deskly_app/features/auth/domain/repos/auth_repo.dart';
import 'package:deskly_app/features/auth/domain/use_case/register/register_params.dart';

class RegisterUseCase implements UseCase<void, RegisterParams> {
  final AuthRepo _authRepo;

  RegisterUseCase({required this._authRepo});
  @override
  Future<Either<Failure, void>> call(RegisterParams param) =>
      _authRepo.register(
        name: param.name,
        email: param.email,
        phone: param.phone,
        password: param.password,
      );
}
