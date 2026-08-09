import 'package:flutter/material.dart';

import 'forgot_password_icon.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [ForgotPasswordIcon(), const SizedBox(height: 24)]);
  }
}
