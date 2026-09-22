import 'package:deskly_app/constants.dart';
import 'package:deskly_app/features/auth/view/widget/login_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'login_header.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LoginHeader()
            .animate(delay: 600.ms)
            .fadeIn(duration: kAnimationDuration)
            .slideY(
              begin: -0.2,
              end: 0,
              duration: kAnimationDuration,
              curve: Curves.easeOut,
            ),
        const Expanded(child: LoginContent()),
      ],
    );
  }
}
