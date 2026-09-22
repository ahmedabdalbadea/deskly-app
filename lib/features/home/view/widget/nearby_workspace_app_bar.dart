import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/widget/custom_back_button.dart';
import 'package:flutter/material.dart';

import 'location_badge.dart';

class NearbyWorkSpaceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onLocationPressed;

  const NearbyWorkSpaceAppBar({super.key, this.onLocationPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const CustomBackButton(),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nearby', style: AppTextStyles.extraBold18(context)),
              Text(
                '6 spaces around you',
                style: AppTextStyles.regular12(
                  context,
                ).copyWith(color: AppColors.mutedPurple),
              ),
            ],
          ),
          const Spacer(),
          LocationBadge(onPressed: onLocationPressed),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
