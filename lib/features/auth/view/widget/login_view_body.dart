import 'package:flutter/material.dart';

import 'login_form.dart';
import 'login_header.dart';
import 'or_divider.dart';
import 'social_auth_list.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginHeader(),
        const SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: LoginForm(),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: OrDivider(),
        ),
        const SizedBox(height: 24),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SocialAuthList(),
        ),
      ],
    );
  }
}
