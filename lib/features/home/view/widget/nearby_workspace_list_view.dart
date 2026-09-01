import 'package:flutter/material.dart';

import 'popular_workspace_list_view_item.dart';

class NearbyWorkspaceListView extends StatelessWidget {
  const NearbyWorkspaceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 16),
      shrinkWrap: true,
      itemCount: 6,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return PopularWorkspaceListViewItem(
          onBookPressed: () {
            // Navigate to booking screen
          },
        );
      },
    );
  }
}
