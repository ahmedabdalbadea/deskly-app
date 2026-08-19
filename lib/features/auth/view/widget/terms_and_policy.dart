import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'gradient_check_box.dart';

class TermsAndPolicy extends StatelessWidget {
  const TermsAndPolicy({
    super.key,
    required this.acceptedTerms,
    required this.validated,
    required this.onChanged,
  });

  final bool acceptedTerms;
  final bool validated;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GradientCheckBox(
              value: acceptedTerms,
              onChanged: onChanged,
              validated: validated,
            ),
            const SizedBox(width: 8),

            Text("I agree to ", style: AppTextStyles.regular12(context)),

            Text(
              "the Terms of Service",
              style: AppTextStyles.regular12(
                context,
              ).copyWith(color: AppColors.primaryPurple),
            ),

            Text(" and ", style: AppTextStyles.regular12(context)),

            Text(
              "Privacy Policy",
              style: AppTextStyles.regular12(
                context,
              ).copyWith(color: AppColors.primaryPurple),
            ),
          ],
        ),

        AnimatedSwitcher(
          duration: kAnimationDuration,
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: !acceptedTerms && !validated
              ? Padding(
                  padding: const EdgeInsets.only(top: 6, left: 6),
                  child: Text(
                    "You must accept the terms",
                    style: AppTextStyles.regular12(
                      context,
                    ).copyWith(color: AppColors.error),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
