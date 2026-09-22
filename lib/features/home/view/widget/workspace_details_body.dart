import 'package:flutter/material.dart';

import 'workspace_details_content.dart';
import 'workspace_header_delegate.dart';

class WorkspaceDetailsBody extends StatelessWidget {
  const WorkspaceDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: WorkspaceHeaderDelegate(),
        ),
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(20, 18, 20, 20),
          sliver: SliverToBoxAdapter(child: WorkspaceDetailsContent()),
        ),
      ],
    );
  }
}
