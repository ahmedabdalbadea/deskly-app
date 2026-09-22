import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_router.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:deskly_app/features/home/manager/workspaces_cubit/workspaces_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'popular_workspaces_list.dart';

class PopularWorkspaces extends StatelessWidget {
  const PopularWorkspaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Popular Workspaces", style: AppTextStyles.bold16(context)),
            Pressable(
              radius: 0,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                context.push(AppRouter.kPopularWorkspaceView);
              },
              child: Text(
                "See All",
                style: AppTextStyles.medium13(
                  context,
                ).copyWith(color: AppColors.primaryPurple),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        PopularWorkspacesList(
          workspaces: context.read<WorkspacesCubit>().popularWorkspaces,
        ),
      ],
    );
  }
}
