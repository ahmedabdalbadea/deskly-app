import 'package:deskly_app/features/home/view/widget/categories_consumer_builder.dart';
import 'package:deskly_app/features/home/view/widget/popular_workspaces_bloc_consumer.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'home_app_bar.dart';
import 'nearby_workspace.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        HomeAppBar(),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CategoriesConsumerBuilder(),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 20)),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PopularWorkspacesBlocConsumer(),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 20)),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: NearbyWorkspace(),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}
