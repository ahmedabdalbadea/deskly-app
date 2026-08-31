import 'package:flutter/material.dart';

import 'widget/nearby_workspace_app_bar.dart';
import 'widget/nearby_workspace_view_body.dart';

class NearbyWorkspaceView extends StatelessWidget {
  const NearbyWorkspaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NearbyWorkSpaceAppBar(),
      body: const NearbyWorkspaceViewBody(),
    );
  }
}
