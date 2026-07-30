import 'package:deskly_app/features/splash/view/widget/blob_background.dart';
import 'package:deskly_app/features/splash/view/widget/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlobBackground(
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SplashViewBody(),
      ),
    );
  }
}
