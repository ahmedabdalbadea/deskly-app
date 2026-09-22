import 'package:bloc/bloc.dart';
import 'package:deskly_app/features/home/domain/entity/workspace_entity.dart';
import 'package:deskly_app/features/home/domain/use%20case/fetch_popular_workspaces_use_case.dart';
import 'package:meta/meta.dart';

part 'workspaces_state.dart';

class WorkspacesCubit extends Cubit<WorkspacesState> {
  WorkspacesCubit({required this._fetchPopularWorkspacesUseCase})
    : super(WorkspacesInitial());

  final FetchPopularWorkspacesUseCase _fetchPopularWorkspacesUseCase;
  List<WorkspaceEntity> popularWorkspaces = [];
  void fetchPopularWordspaces() {
    emit(PopularWorkspacesLoading());

    _fetchPopularWorkspacesUseCase.call().listen((event) {
      event.fold(
        (failure) {
          emit(PopularWorkspacesFailure(failure.message));
        },
        (workspacesResult) {
          if (workspacesResult.workspaces.isEmpty) {
            emit(PopularWorkspacesEmptyResult());
          } else {
            popularWorkspaces = workspacesResult.workspaces;
            emit(PopularWorkspacesSuccess());
          }
        },
      );
    });
  }

  
}
