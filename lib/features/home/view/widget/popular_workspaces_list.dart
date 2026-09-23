import 'package:deskly_app/core/utils/app_router.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:deskly_app/features/home/domain/entity/workspace_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'popular_workspaces_item.dart';

class PopularWorkspacesList extends StatelessWidget {
  const PopularWorkspacesList({super.key, required this.workspaces});
  final List<WorkspaceEntity> workspaces;
  @override
  Widget build(BuildContext context) {
    final len = workspaces.take(2).length;
    return Column(
      children: List.generate(
        len,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: index == len - 1 ? 0 : 12),
          child: Pressable(
            radius: 16,
            onPressed: () {
              context.push(AppRouter.kWorkspaceDetialsView);
            },
            child: PopularWorkspacesItem(workspace: workspaces[index]),
          ),
        ),
      ),
    );
  }
}
