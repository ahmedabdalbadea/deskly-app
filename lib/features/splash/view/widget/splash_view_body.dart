import 'package:deskly_app/features/splash/view/widget/deskly_logo.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [DesklyLogo(), SizedBox(height: 28)],
    );
  }
}
