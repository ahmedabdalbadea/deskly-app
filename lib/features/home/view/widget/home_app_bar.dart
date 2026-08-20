import 'package:flutter/material.dart';

import 'home_search_bar.dart';
import 'notification_button.dart';
import 'profile_avatar.dart';
import 'user_greeting.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Row(
          children: [
            const UserGreeting(greeting: 'Good morning,', userName: 'Ahmed'),
            const Spacer(),
            NotificationButton(onPressed: () {}),
            const SizedBox(width: 10),
            ProfileAvatar(onPressed: () {}),
          ],
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(66),
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 16),
          child: HomeSearchBar(),
        ),
      ),
    );
  }
}
