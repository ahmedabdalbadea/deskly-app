import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/core/use_case/no_param_stream_use_case.dart';
import 'package:deskly_app/features/home/domain/entity/workspaces_result.dart';
import 'package:deskly_app/features/home/domain/repos/home_repo.dart';

class FetchPopularWorkspacesUseCase implements StreamUseCase<WorkspacesResult> {
  final HomeRepo homeRepo;
  FetchPopularWorkspacesUseCase({required this.homeRepo});

  @override
  Stream<Either<Failure, WorkspacesResult>> call() {
    return homeRepo.fetchPopularWorkspaces();
  }
}
