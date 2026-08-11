import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure, T>> call(Param p);
}
