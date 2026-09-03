import 'package:flutter/material.dart';

import 'widget/workspace_details_body.dart';

class WorkspaceDetailsView extends StatelessWidget {
  const WorkspaceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(top: false, child: WorkspaceDetailsBody()),
    );
  }
}
