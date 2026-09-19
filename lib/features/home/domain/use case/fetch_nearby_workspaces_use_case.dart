import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/core/use_case/stream_use_case.dart';

import '../entity/workspace_entity.dart';
import '../repos/home_repo.dart';

class FetchNearbyWorkspacesParams {
  final double latitude;
  final double longitude;
  final double radius;

  const FetchNearbyWorkspacesParams({
    required this.latitude,
    required this.longitude,
    required this.radius,
  });
}

class FetchNearbyWorkspacesUseCase
    implements
        StreamUseCase<List<WorkspaceEntity>, FetchNearbyWorkspacesParams> {
  final HomeRepo homeRepo;

  FetchNearbyWorkspacesUseCase({required this.homeRepo});

  @override
  Stream<Either<Failure, List<WorkspaceEntity>>> call(
    FetchNearbyWorkspacesParams param,
  ) {
    return homeRepo.fetchNearbyWorkspaces(
      latitude: param.latitude,
      longitude: param.longitude,
      radius: param.radius,
    );
  }
}
