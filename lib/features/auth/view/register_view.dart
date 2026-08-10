import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widget/custom_back_button.dart';
import 'widget/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 12, top: 16),
            child: CustomBackButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: const SafeArea(child: RegisterViewBody()),
    );
  }
}
