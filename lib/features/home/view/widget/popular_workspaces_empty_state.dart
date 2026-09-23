import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PopularWorkspacesEmptyState extends StatelessWidget {
  const PopularWorkspacesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16, bottom: 28, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Popular Workspaces",
              style: AppTextStyles.bold16(context),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.storefront_outlined,
              size: 30,
              color: AppColors.primaryPurple,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "No Workspaces Available",
            style: AppTextStyles.bold15(
              context,
            ).copyWith(color: AppColors.primaryText),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            "Check back soon for new workspaces near you.",
            style: AppTextStyles.regular13(
              context,
            ).copyWith(color: AppColors.secondaryText),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
