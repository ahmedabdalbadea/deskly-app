import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PopularWorkspacesItemDetails extends StatelessWidget {
  const PopularWorkspacesItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        children: [
          Row(
            children: [
              Text("The Hub Cairo", style: AppTextStyles.bold15(context)),
              const Spacer(),
              Text(
                "EGP 80/",
                style: AppTextStyles.bold15(
                  context,
                ).copyWith(color: AppColors.primaryPurple),
              ),
              Text(
                "hr",
                style: AppTextStyles.regular11(
                  context,
                ).copyWith(color: AppColors.mutedText),
              ),
            ],
          ),

          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 14,
                color: AppColors.mutedPurple,
              ),
              const SizedBox(width: 5),
              Text(
                "Cairo, Egypt",
                style: AppTextStyles.regular12(
                  context,
                ).copyWith(color: AppColors.mutedPurple),
              ),
              const SizedBox(width: 5),
              Text(
                "•",
                style: AppTextStyles.regular12(
                  context,
                ).copyWith(color: AppColors.mutedPurple),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.star, size: 14, color: Color(0xffFBBF24)),
              const SizedBox(width: 5),
              Text("4.8", style: AppTextStyles.semiBold12(context)),
              const SizedBox(width: 5),
              Text(
                "(124)",
                style: AppTextStyles.regular12(
                  context,
                ).copyWith(color: AppColors.mutedPurple),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
