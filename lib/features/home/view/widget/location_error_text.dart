import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:flutter/material.dart';

class LocationErrorText extends StatelessWidget {
  const LocationErrorText({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.medium13(
                context,
              ).copyWith(color: AppColors.secondaryText),
            ),
            const SizedBox(height: 8),
            Pressable(
              radius: 0,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: onRetry,
              child: Text(
                'Try again',
                style: AppTextStyles.semiBold13(
                  context,
                ).copyWith(color: AppColors.primaryPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}