import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularWorkspacesSkeletonizerLoading extends StatelessWidget {
  const PopularWorkspacesSkeletonizerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Popular Workspaces", style: AppTextStyles.bold16(context)),
              Text(
                "See All",
                style: AppTextStyles.medium13(
                  context,
                ).copyWith(color: AppColors.primaryPurple),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Column(
            children: List.generate(
              2,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: index == 1 ? 0 : 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          color: Colors.grey[300],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Workspace Name Placeholder",
                                    style: AppTextStyles.bold15(context),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "EGP 250/",
                                    style: AppTextStyles.bold15(context),
                                  ),
                                  Text(
                                    "hr",
                                    style: AppTextStyles.regular11(context),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Cairo, Egypt",
                                    style: AppTextStyles.regular12(context),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "•",
                                    style: AppTextStyles.regular12(context),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(Icons.star, size: 14),
                                  const SizedBox(width: 5),
                                  Text(
                                    "4.5",
                                    style: AppTextStyles.semiBold12(context),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "(120)",
                                    style: AppTextStyles.regular12(context),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
