import 'package:deskly_app/features/onboarding/view/onboarding_view.dart';
import 'package:deskly_app/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnboardingView = "/onboarding_view";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: kOnboardingView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const OnboardingView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
    ],
  );
}
