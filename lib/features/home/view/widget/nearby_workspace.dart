import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:flutter/material.dart';

import 'nearby_workspace_list.dart';

class NearbyWorkspace extends StatelessWidget {
  const NearbyWorkspace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Nearby Workspace", style: AppTextStyles.bold16(context)),
            Pressable(
              radius: 0,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {},
              child: Text(
                "See All",
                style: AppTextStyles.medium13(
                  context,
                ).copyWith(color: AppColors.primaryPurple),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        const NearbyWorkspaceList(),
      ],
    );
  }
}
