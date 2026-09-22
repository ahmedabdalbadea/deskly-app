import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TrendingItem extends StatelessWidget {
  const TrendingItem({super.key, required this.icon, required this.label});
  final String icon, label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyles.medium13(
              context,
            ).copyWith(color: const Color(0xff4A4A6A)),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.trending_up_rounded,
            size: 16,
            color: Color(0xffB0B0C8),
          ),
        ],
      ),
    );
  }
}
