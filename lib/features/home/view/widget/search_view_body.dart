import 'package:flutter/material.dart';

import 'browse_by_type.dart';
import 'recent_search.dart';
import 'search_app_bar.dart';
import 'trending.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SearchAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 24,
              right: 24,
              bottom: 16,
            ),
            child: RecentSearch(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24,
              top: 8,
              bottom: 1,
            ),
            child: Trending(),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
            child: BrowseByType(),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
