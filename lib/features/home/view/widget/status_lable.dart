import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class StatusLabel extends StatelessWidget {
  final bool isOpen;

  const StatusLabel({super.key, required this.isOpen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: isOpen
            ? Colors.green.withValues(alpha: 0.12)
            : Colors.red.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        isOpen ? 'Open' : 'Closed',
        style: AppTextStyles.medium11(
          context,
        ).copyWith(fontSize: 9, color: isOpen ? Colors.green : Colors.red),
      ),
    );
  }
}
