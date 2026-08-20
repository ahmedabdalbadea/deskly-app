import 'package:flutter/material.dart';

import 'categories.dart';
import 'home_app_bar.dart';
import 'popular_workspaces.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          HomeAppBar(),
          SliverToBoxAdapter(child: Categories()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: PopularWorkspaces()),

          SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
