import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/widget/gradient_button.dart';
import 'package:flutter/material.dart';

import 'status_lable.dart';
import 'workspace_services.dart';

class PopularWorkspaceListViewItemDetails extends StatelessWidget {
  final String name;
  final String type;
  final String distance;
  final String rating;
  final String price;
  final bool isOpen;
  final VoidCallback? onBookPressed;

  const PopularWorkspaceListViewItemDetails({
    super.key,
    required this.name,
    required this.type,
    required this.distance,
    required this.rating,
    required this.price,
    required this.isOpen,
    this.onBookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bold14(context),
            ),
            const Spacer(),
            StatusLabel(isOpen: isOpen),
          ],
        ),
        const SizedBox(height: 4),

        Text(
          "$type· 🚶 $distance",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.regular11(
            context,
          ).copyWith(color: AppColors.mutedPurple),
        ),
        const SizedBox(height: 3),

        Row(
          children: [
            const Icon(Icons.star, size: 14, color: Colors.orange),
            const SizedBox(width: 3),
            Text(rating, style: AppTextStyles.medium11(context)),
          ],
        ),

        const WorkspaceServices(),

        const Spacer(),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'EGP $price',
              style: AppTextStyles.extraBold16(
                context,
              ).copyWith(color: AppColors.primaryPurple),
            ),
            Text(
              '/hr',
              style: AppTextStyles.regular11(
                context,
              ).copyWith(color: AppColors.mutedPurple),
            ),
            const Spacer(),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 80),
              child: GradientButton(
                title: isOpen ? 'Book' : 'Closed',
                radius: 10,
                padding: const EdgeInsets.symmetric(vertical: 8),
                onPressed: isOpen ? onBookPressed : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
