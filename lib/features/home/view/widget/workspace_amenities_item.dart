import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class WorkspaceAmenitiesItem extends StatelessWidget {
  const WorkspaceAmenitiesItem({super.key, required this.amenity});
  final ({IconData icon, String label}) amenity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(amenity.icon, size: 13, color: Colors.deepPurple),
          const SizedBox(width: 5),
          Text(amenity.label, style: AppTextStyles.medium12(context)),
        ],
      ),
    );
  }
}
