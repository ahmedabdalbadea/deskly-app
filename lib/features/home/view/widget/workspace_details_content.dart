import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'available_times.dart';
import 'workspace_amenities.dart';
import 'workspace_gallery.dart';

class WorkspaceDetailsContent extends StatelessWidget {
  const WorkspaceDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'The Hub Cairo',
                  style: AppTextStyles.extraBold22(context),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: AppColors.primaryPurple,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '26 Street 37, Maadi, Cairo',
                      style: AppTextStyles.regular13(
                        context,
                      ).copyWith(color: AppColors.primaryPurple),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),

            Column(
              crossAxisAlignment: .end,
              children: [
                Text(
                  'EGP 80',
                  style: AppTextStyles.extraBold22(
                    context,
                  ).copyWith(color: Colors.deepPurple),
                ),

                Text(
                  "per hour",
                  textAlign: TextAlign.right,
                  style: AppTextStyles.regular11(
                    context,
                  ).copyWith(color: AppColors.mutedText),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          'A premium co-working space in the heart of Maadi. '
          'Featuring state-of-the-art amenities, blazing-fast '
          'internet, and a vibrant community of professionals. '
          'Perfect for individuals and teams looking for an '
          'inspiring work environment.',
          style: AppTextStyles.regular14(
            context,
          ).copyWith(color: AppColors.mutedText, height: 1.6),
        ),
        const SizedBox(height: 22),
        const WorkspaceAmenities(),
        const SizedBox(height: 22),
        const WorkspaceGallery(),
        const SizedBox(height: 22),
        const AvailableTimes(),
      ],
    );
  }
}
