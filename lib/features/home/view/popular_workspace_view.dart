import 'package:deskly_app/features/home/view/widget/popular_workspace_view_body.dart';
import 'package:flutter/material.dart';

import 'widget/popular_workspace_view_app_bar.dart';

class PopularWorkspaceView extends StatefulWidget {
  const PopularWorkspaceView({super.key});

  @override
  State<PopularWorkspaceView> createState() => _PopularWorkspaceViewState();
}

class _PopularWorkspaceViewState extends State<PopularWorkspaceView> {
  final ValueNotifier<bool> showChips = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PopularWorkSpaceAppBar(
        onSortTap: () {
          showChips.value = !showChips.value;
        },
      ),
      body: SafeArea(child: PopularWorkspaceViewBody(showChips: showChips)),
    );
  }
}
