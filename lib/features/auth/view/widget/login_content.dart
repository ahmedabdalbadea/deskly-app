import 'package:flutter/material.dart';

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

            LoginForm(),

            const SizedBox(height: 24),

            OrDivider(),

            const SizedBox(height: 24),

            SocialAuthList(),

            const SizedBox(height: 24),

            LoginNavigation(),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
