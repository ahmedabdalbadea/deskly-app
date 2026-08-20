import 'package:deskly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import 'popular_workspaces_item_details.dart';

class PopularWorkspacesItem extends StatelessWidget {
  const PopularWorkspacesItem({super.key});

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
            Image.asset(AppImages.workspaceTest, fit: BoxFit.fill, height: 150, width: double.infinity,),
            PopularWorkspacesItemDetails(),
          ],
        ),
      ),
    );
  }
}
