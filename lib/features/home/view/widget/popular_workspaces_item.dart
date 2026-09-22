import 'package:cached_network_image/cached_network_image.dart';
import 'package:deskly_app/features/home/domain/entity/workspace_entity.dart';
import 'package:flutter/material.dart';

import 'popular_workspaces_item_details.dart';

class PopularWorkspacesItem extends StatelessWidget {
  const PopularWorkspacesItem({super.key, required this.workspace});
  final WorkspaceEntity workspace;
  @override
  Widget build(BuildContext context) {
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: workspace.images[0],
              fit: BoxFit.fill,
              height: 150,
              width: double.infinity,
            ),
            PopularWorkspacesItemDetails(workspace: workspace),
          ],
        ),
      ),
    );
  }
}
