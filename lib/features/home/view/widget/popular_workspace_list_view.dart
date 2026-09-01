import 'package:deskly_app/core/utils/app_router.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:deskly_app/features/home/view/widget/popular_workspace_list_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopularWorkspaceListView extends StatelessWidget {
  const PopularWorkspaceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 16),
      shrinkWrap: true,
      itemCount: 6,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return Pressable(
          radius: 16,
          onPressed: () {
            context.push(AppRouter.kWorkspaceDetialsView);
          },
          child: PopularWorkspaceListItem(
            onBookPressed: () {
              // Navigate to booking screen
            },
          ),
        );
      },
    );
  }
}
