import 'package:deskly_app/features/home/domain/entity/workspace_entity.dart';

class WorkspacesResult {
  final List<WorkspaceEntity> workspaces;
  final Object? nextCursor;

  WorkspacesResult({required this.workspaces, required this.nextCursor});
}
