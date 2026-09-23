import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class UserGreeting extends StatelessWidget {
  const UserGreeting({
    super.key,
    required this.greeting,
    required this.userName,
  });

  final String greeting;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: .start,
      children: [
        Text(
          greeting,
          style: AppTextStyles.regular13(
            context,
          ).copyWith(color: AppColors.mutedText),
        ),
        const SizedBox(height: 2),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  userName,
                  style: AppTextStyles.semiBold20(context).copyWith(
                    color: AppColors.primaryText,
                    overflow: TextOverflow.fade,
                  ),
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 4),
              Text('👋', style: AppTextStyles.regular18(context)),
            ],
          ),
        ),
      ],
    );
  }
}
