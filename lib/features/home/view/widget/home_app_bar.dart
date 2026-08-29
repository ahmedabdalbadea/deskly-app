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
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,

      title: SafeArea(
        left: false,
        bottom: false,
        right: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SizedBox(height: 8),
              const UserGreeting(greeting: 'Good morning,', userName: 'Ahmed'),
              const Spacer(),
              NotificationButton(onPressed: () {}),
              const SizedBox(width: 10),
              ProfileAvatar(onPressed: () {}),
            ],
          ),
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            top: 16,
            bottom: 24,
            right: 20,
            left: 20,
          ),
          child: HomeSearchBar(),
        ),
      ),
    );
  }
}
