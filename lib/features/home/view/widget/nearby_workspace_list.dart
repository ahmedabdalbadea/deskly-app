import 'package:deskly_app/core/utils/app_router.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'nearby_workspace_item.dart';

class NearbyWorkspaceList extends StatelessWidget {
  const NearbyWorkspaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Padding(
          padding: EdgeInsets.only(right: index == 2 ? 0 : 12),
          child: Pressable(
            radius: 16,
            onPressed: () {
              context.push(AppRouter.kWorkspaceDetialsView);
            },
            child: const NearbyWorkspaceItem(),
          ),
        ),
      ),
    );
  }
}
