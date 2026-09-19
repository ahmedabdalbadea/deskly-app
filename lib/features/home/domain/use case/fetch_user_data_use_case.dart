import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/core/use_case/no_param_stream_use_case.dart';
import '../entity/user_entity.dart';
import '../repos/home_repo.dart';

class FetchUserDataUseCase implements StreamUseCase<UserEntity> {
  final HomeRepo homeRepo;

  FetchUserDataUseCase({required this.homeRepo});

  @override
  Stream<Either<Failure, UserEntity>> call() {
    return homeRepo.fetchUserData();
  }
}
