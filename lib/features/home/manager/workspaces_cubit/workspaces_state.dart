part of 'workspaces_cubit.dart';

@immutable
sealed class WorkspacesState {}

final class WorkspacesInitial extends WorkspacesState {}

final class PopularWorkspacesSuccess extends WorkspacesState {}

final class PopularWorkspacesLoading extends WorkspacesState {}

final class PopularWorkspacesFailure extends WorkspacesState {
  final String message;

  PopularWorkspacesFailure(this.message);
}

final class PopularWorkspacesEmptyResult extends WorkspacesState {}

final class NearbyWorkspacesSuccess extends WorkspacesState {}

final class NearbyWorkspacesLoading extends WorkspacesState {}

final class NearbyWorkspacesFailure extends WorkspacesState {
  final String message;

  NearbyWorkspacesFailure(this.message);
}

final class NearbyWorkspacesEmptyResult extends WorkspacesState {}
