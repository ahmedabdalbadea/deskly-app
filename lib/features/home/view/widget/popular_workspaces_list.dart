import 'package:flutter/material.dart';

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
          child: const PopularWorkspacesItem(),
        ),
      ),
    );
  }
}
