import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/core/use_case/use_case.dart';
import '../entity/workspace_entity.dart';
import '../repos/home_repo.dart';

class FetchWorkspacesByCategoryParams {
  final String categoryId;
  final double latitude;
  final double longitude;

  const FetchWorkspacesByCategoryParams({
    required this.categoryId,
    required this.latitude,
    required this.longitude,
  });
}

class FetchWorkspacesByCategoryUseCase
    implements UseCase<List<WorkspaceEntity>, FetchWorkspacesByCategoryParams> {
  final HomeRepo homeRepo;

  FetchWorkspacesByCategoryUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<WorkspaceEntity>>> call(
    FetchWorkspacesByCategoryParams param,
  ) async {
    return await homeRepo.fetchWorkspacesByCategory(
      categoryId: param.categoryId,
      latitude: param.latitude,
      longitude: param.longitude,
    );
  }
}
