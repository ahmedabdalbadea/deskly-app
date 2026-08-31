import 'package:flutter/material.dart';

import 'widget/nearby_workspace_view_body.dart';

class NearbyWorkspaceView extends StatelessWidget {
  const NearbyWorkspaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nearby Workspaces')),
      body: const NearbyWorkspaceViewBody(),
    );
  }
}
