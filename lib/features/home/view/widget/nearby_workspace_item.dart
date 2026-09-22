import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/features/home/view/widget/nearby_workspace_item_details.dart';
import 'package:flutter/material.dart';

class NearbyWorkspaceItem extends StatelessWidget {
  const NearbyWorkspaceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: MediaQuery.widthOf(context) / 3.7,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImages.workspaceTest, fit: BoxFit.fill, height: 90),

            const NearbyWorkspaceItemDetails(),
          ],
        ),
      ),
    );
  }
}
