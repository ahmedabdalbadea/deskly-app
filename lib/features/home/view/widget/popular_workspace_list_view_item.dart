import 'package:deskly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import 'popular_workspace_list_item_view_image.dart';
import 'popular_workspace_list_view_item_details.dart';

class PopularWorkspaceListViewItem extends StatelessWidget {
  final VoidCallback? onBookPressed;

  const PopularWorkspaceListViewItem({super.key, this.onBookPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const PopularWorkspaceListItemViewImage(
            image: AppImages.workspaceTest,
            distance: '0.8 km',
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 8, bottom: 8),
              child: PopularWorkspaceListViewItemDetails(
                name: 'The Hub Cairo',
                type: 'Hot Desk',
                distance: '5 min drive',
                rating: '4.8',
                price: '80',
                isOpen: true,
                onBookPressed: onBookPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
