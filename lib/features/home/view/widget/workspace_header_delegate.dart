import 'package:flutter/material.dart';

import 'workspace_header.dart';

class WorkspaceHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 275;

  @override
  double get maxExtent => 275;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => WorkspaceHeader();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
