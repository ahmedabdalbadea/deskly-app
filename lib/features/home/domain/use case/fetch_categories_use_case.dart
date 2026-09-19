import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/core/use_case/no_param_stream_use_case.dart';
import '../entity/category_entity.dart';
import '../repos/home_repo.dart';

class FetchCategoriesUseCase implements StreamUseCase<List<CategoryEntity>> {
  final HomeRepo homeRepo;

  FetchCategoriesUseCase({required this.homeRepo});

  @override
  Stream<Either<Failure, List<CategoryEntity>>> call() {
    return homeRepo.fetchCategories();
  }
}