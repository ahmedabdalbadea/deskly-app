import 'package:deskly_app/features/auth/view/widget/or_divider.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';
import 'login_header.dart';

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
      ],
    );
  }
}
