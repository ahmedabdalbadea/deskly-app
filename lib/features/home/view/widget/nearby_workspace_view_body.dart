import 'package:deskly_app/features/home/view/widget/filter_chips_list.dart';
import 'package:flutter/material.dart';

class NearbyWorkspaceViewBody extends StatelessWidget {
  const NearbyWorkspaceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 8),
          color: Colors.white,
          alignment: Alignment.center,
          child: const FilterChipsList(
            chips: ['All', '< 0.5 km', '< 1 km', '< 2 km', '< 5 km'],
          ),
        ),
      ],
    );
  }
}
