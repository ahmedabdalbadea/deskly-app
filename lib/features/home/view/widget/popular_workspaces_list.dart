import 'package:deskly_app/core/utils/app_router.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'popular_workspaces_item.dart';

class PopularWorkspacesList extends StatelessWidget {
  const PopularWorkspacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        2,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: index == 1 ? 0 : 12),
          child: Pressable(
            radius: 16,
            onPressed: () {
              context.push(AppRouter.kWorkspaceDetialsView);
            },
            child: const PopularWorkspacesItem(),
          ),
        ),
      ),
    );
  }
}
