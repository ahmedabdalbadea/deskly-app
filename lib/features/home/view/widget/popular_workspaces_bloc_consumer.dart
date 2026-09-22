import 'package:deskly_app/core/functions/app_snackbar.dart';
import 'package:deskly_app/features/home/manager/workspaces_cubit/workspaces_cubit.dart';

import 'package:deskly_app/features/home/view/widget/popular_workspaces.dart';
import 'package:deskly_app/features/home/view/widget/popular_workspaces_empty_state.dart';
import 'package:deskly_app/features/home/view/widget/popular_workspaces_skeletonizer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularWorkspacesBlocConsumer extends StatelessWidget {
  const PopularWorkspacesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkspacesCubit, WorkspacesState>(
      listener: (context, state) {
        if (state is PopularWorkspacesFailure) {
          AppSnackBar.showError(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is PopularWorkspacesSuccess) {
          return const PopularWorkspaces();
        }
        if (state is PopularWorkspacesEmptyResult) {
          return const PopularWorkspacesEmptyState();
        }
        return const PopularWorkspacesSkeletonizerLoading();
      },
    );
  }
}
