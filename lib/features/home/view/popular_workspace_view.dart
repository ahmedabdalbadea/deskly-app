import 'package:deskly_app/features/home/view/widget/popular_workspace_view_body.dart';
import 'package:flutter/material.dart';

class PopularWorkspaceView extends StatelessWidget {
  const PopularWorkspaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: PopularWorkspaceViewBody()));
  }
}
