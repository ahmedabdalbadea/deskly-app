import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class WorkspaceHeaderBottomInfo extends StatelessWidget {
  const WorkspaceHeaderBottomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text('4.9', style: AppTextStyles.bold11(context)),
              const SizedBox(width: 4),
              Text(
                '(128)',
                style: AppTextStyles.bold12(
                  context,
                ).copyWith(color: AppColors.mutedPurple),
              ),
            ],
          ),
        ),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryPurple,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Text(
            'Open Now',
            style: AppTextStyles.bold12(context).copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
