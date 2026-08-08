import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(height: 1)),
        const SizedBox(width: 16),
        Text(
          "or continue with",
          style: AppTextStyles.regular12(
            context,
          ).copyWith(color: AppColors.mutedText),
        ),
        const SizedBox(width: 16),
        const Expanded(child: Divider(height: 1)),
      ],
    );
  }
}
