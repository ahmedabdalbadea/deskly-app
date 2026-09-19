import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';

abstract class StreamUseCase<T, Param> {
  Stream<Either<Failure, T>> call(Param p);
}
