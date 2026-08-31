import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/widget/gradient_button.dart';
import 'package:flutter/material.dart';

import 'favorite_button.dart';

class PopularWorkspaceListItemDetails extends StatelessWidget {
  const PopularWorkspaceListItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "The Hub Cairo",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bold14(context),
            ),
            const Spacer(),
            const FavoriteButton(),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          '📍 Maadi, Cairo · Hot Desk',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.regular11(
            context,
          ).copyWith(color: AppColors.mutedPurple),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Icon(Icons.star, size: 14, color: Colors.orange),
            const SizedBox(width: 3),
            Text("4.8", style: AppTextStyles.medium11(context)),
            const SizedBox(width: 4),
            Text(
              '(128 reviews)',
              style: AppTextStyles.regular11(
                context,
              ).copyWith(color: AppColors.mutedPurple),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              'EGP 80',
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
              constraints: BoxConstraints(maxWidth: 75),
              child: GradientButton(
                title: "Book",
                radius: 10,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
