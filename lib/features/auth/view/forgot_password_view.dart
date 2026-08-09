import 'package:deskly_app/features/auth/view/widget/forgot_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: ForgotPasswordViewBody()));
  }
}
