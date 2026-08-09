import 'package:deskly_app/features/auth/view/widget/forgot_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widget/custom_back_button.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 12, top: 12),
            child: CustomBackButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: const SafeArea(child: ForgotPasswordViewBody()),
    );
  }
}
