import 'package:deskly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import 'workspace_header_bottom_info.dart';
import 'workspace_header_top_actions.dart';

class WorkspaceHeader extends StatelessWidget {
  const WorkspaceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 18),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.workspaceTest),
          fit: BoxFit.fill,
        ),
      ),
      child: const Column(
        children: [
          SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: WorkspaceHeaderTopActions(),
          ),
          Spacer(),
          WorkspaceHeaderBottomInfo(),
        ],
      ),
    );
  }
}
