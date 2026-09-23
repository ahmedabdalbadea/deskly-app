import 'package:deskly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_search_bar.dart';
import 'user_greeting_bloc_builder.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,

      title: const SafeArea(
        left: false,
        bottom: false,
        right: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: UserGreetingBlocBuilder(),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Padding(
          padding: const EdgeInsetsGeometry.only(
            top: 16,
            bottom: 24,
            right: 20,
            left: 20,
          ),
          child: HomeSearchBar(
            readOnly: true,
            onTap: () {
              context.push(AppRouter.kSearchView);
            },
          ),
        ),
      ),
    );
  }
}
