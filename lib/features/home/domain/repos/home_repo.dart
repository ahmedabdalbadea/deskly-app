import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/features/home/domain/entity/category_entity.dart';
import 'package:deskly_app/features/home/domain/entity/user_entity.dart';
import 'package:deskly_app/features/home/domain/entity/workspace_entity.dart';
import 'package:deskly_app/features/home/domain/entity/workspaces_result.dart';

abstract class HomeRepo {
  Stream<Either<Failure, UserEntity>> fetchUserData();
  Stream<Either<Failure, List<CategoryEntity>>> fetchCategories();
  Future<Either<Failure, List<WorkspaceEntity>>> fetchWorkspacesByCategory({
    required String categoryId,
    required double latitude,
    required double longitude,
  });
  Stream<Either<Failure, WorkspacesResult>> fetchPopularWorkspaces({
    Object? startAfter,
    int pageSize = 10,
  });
  Stream<Either<Failure, List<WorkspaceEntity>>> fetchNearbyWorkspaces({
    required double latitude,
    required double longitude,
    required double radius,
  });
}
