import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/features/home/view/widget/popular_workspace_list_item_image.dart';
import 'package:flutter/material.dart';

import 'popular_workspace_list_item_details.dart';

class PopularWorkspaceListItem extends StatelessWidget {
  final VoidCallback? onBookPressed;

  const PopularWorkspaceListItem({super.key, this.onBookPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 135,
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
              PopularWorkspaceListItemImage(image: AppImages.workspaceTest),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, bottom: 8),
                  child: PopularWorkspaceListItemDetails(),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: -12,
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "#1",
              style: AppTextStyles.extraBold11(
                context,
              ).copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
