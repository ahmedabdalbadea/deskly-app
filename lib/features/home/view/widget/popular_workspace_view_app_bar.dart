import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/widget/custom_back_button.dart';
import 'package:flutter/material.dart';

import 'sort_button.dart';

class PopularWorkSpaceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PopularWorkSpaceAppBar({super.key, required this.onSortTap});
  final VoidCallback? onSortTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          CustomBackButton(),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular Workspaces',
                style: AppTextStyles.extraBold18(context),
              ),
              Text(
                '6 highly-rated spaces',
                style: AppTextStyles.regular12(
                  context,
                ).copyWith(color: AppColors.mutedPurple),
              ),
            ],
          ),
          const Spacer(),
          SortButton(onPressed: onSortTap),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
