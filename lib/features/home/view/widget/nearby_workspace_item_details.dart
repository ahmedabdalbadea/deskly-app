import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class NearbyWorkspaceItemDetails extends StatelessWidget {
  const NearbyWorkspaceItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("The Hub Cairo", style: AppTextStyles.bold12(context)),
          const SizedBox(height: 5),
          Text(
            "EGP 80/hr",
            style: AppTextStyles.semiBold11(
              context,
            ).copyWith(color: AppColors.primaryPurple),
          ),
          const SizedBox(height: 5),
          Text(
            "📍 0.3 km",
            style: AppTextStyles.regular10(
              context,
            ).copyWith(color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }
}
