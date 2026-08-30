import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class RecentSearchItem extends StatelessWidget {
  const RecentSearchItem({super.key, required this.label, this.onPressed});
  final String label;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.history, color: Color(0xffC0C0D8), size: 16),
      ),
      title: Text(label, style: AppTextStyles.regular14(context)),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.add, color: Color(0xffC0C0D8), size: 16),
      ),
    );
  }
}
