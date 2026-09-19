import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deskly_app/features/home/data/model/workspace_model/workspace_model.dart';

class WorkspacesPage {
  final List<WorkspaceModel> workspaces;
  final DocumentSnapshot? lastDocument;

  WorkspacesPage({required this.workspaces, required this.lastDocument});
}
