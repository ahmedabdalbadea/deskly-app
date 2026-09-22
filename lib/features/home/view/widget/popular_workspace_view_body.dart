import 'package:flutter/material.dart';

import 'animated_filter_chips.dart';
import 'popular_workspace_list_view.dart';

class PopularWorkspaceViewBody extends StatelessWidget {
  const PopularWorkspaceViewBody({super.key, required this.showChips});
  final ValueNotifier<bool> showChips;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedFilterChips(showChips: showChips),
        const SizedBox(height: 16),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: PopularWorkspaceListView(),
          ),
        ),
      ],
    );
  }
}
