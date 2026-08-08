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
      ],
    );
  }
}
