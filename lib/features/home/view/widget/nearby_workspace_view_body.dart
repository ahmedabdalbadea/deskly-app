import 'package:flutter/material.dart';

import 'filter_chips_list.dart';
import 'nearby_workspace_list_view.dart';

class NearbyWorkspaceViewBody extends StatelessWidget {
  const NearbyWorkspaceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          color: Colors.white,
          alignment: Alignment.center,
          child: const FilterChipsList(
            chips: ['All', '< 0.5 km', '< 1 km', '< 2 km', '< 5 km'],
          ),
        ),
        const SizedBox(height: 16),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: NearbyWorkspaceListView(),
          ),
        ),
      ],
    );
  }
}
