import 'package:deskly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'login_form.dart';
import 'login_navigation.dart';
import 'or_divider.dart';
import 'social_auth_list.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 28),

            LoginForm()
                .animate(delay: 600.ms)
                .fadeIn(duration: kAnimationDuration)
                .slideY(
                  begin: 0.15,
                  end: 0,
                  duration: kAnimationDuration,
                  curve: Curves.easeOut,
                ),

            const SizedBox(height: 24),

            OrDivider(),

            const SizedBox(height: 24),

            SocialAuthList()
                .animate(delay: 800.ms)
                .fadeIn(duration: kAnimationDuration)
                .slideY(begin: 0.1, end: 0, duration: kAnimationDuration),

            const SizedBox(height: 24),

            LoginNavigation(),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
