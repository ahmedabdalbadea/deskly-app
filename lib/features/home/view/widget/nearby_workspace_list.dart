import 'package:flutter/material.dart';

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
          child: const NearbyWorkspaceItem(),
        ),
      ),
    );
  }
}
