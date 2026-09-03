import 'package:deskly_app/core/widget/custom_back_button.dart';
import 'package:deskly_app/core/widget/custom_icon_button.dart';
import 'package:flutter/material.dart';

class WorkspaceHeaderTopActions extends StatelessWidget {
  const WorkspaceHeaderTopActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBackButton(
          backgroundColor: Colors.white.withValues(alpha: 0.2),
          iconColor: Colors.white,
        ),
        const Spacer(),
        CustomIconButton(
          icon: Icons.favorite_border_rounded,
          backgroundColor: Colors.white.withValues(alpha: 0.2),
          iconColor: const Color(0xffFF6B8A),
          onPressed: () {},
        ),
        const SizedBox(width: 7),
        CustomIconButton(
          icon: Icons.more_vert_rounded,
          backgroundColor: Colors.white.withValues(alpha: 0.2),
          iconColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
