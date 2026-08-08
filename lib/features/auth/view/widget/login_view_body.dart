import 'package:deskly_app/features/auth/view/widget/login_content.dart';
import 'package:flutter/material.dart';

import 'login_header.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginHeader(),
        Expanded(child: LoginContent()),
      ],
    );
  }
}
