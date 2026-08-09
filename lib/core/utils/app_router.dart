import 'package:deskly_app/constants.dart';
import 'package:deskly_app/features/auth/view/forgot_password_view.dart';
import 'package:deskly_app/features/auth/view/login_view.dart';
import 'package:deskly_app/features/auth/view/register_view.dart';
import 'package:deskly_app/features/onboarding/view/onboarding_view.dart';
import 'package:deskly_app/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnboardingView = "/onboarding_view";
  static const kLoginView = "/login_view";
  static const kRegisterView = "/register_view";
  static const kForgotPasswordView = "/forgot_password_view";
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
            transitionDuration: kTransitionDuration,
            child: const OnboardingView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),

      GoRoute(
        path: kLoginView,
        builder: (context, state) {
          return const LoginView();
        },
      ),

      GoRoute(
        path: kForgotPasswordView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const ForgotPasswordView(),
            transitionDuration: kTransitionDuration,
            reverseTransitionDuration: kTransitionDuration,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position:
                        Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.ease,
                          ),
                        ),
                    child: child,
                  );
                },
          );
        },
      ),

      GoRoute(
        path: kRegisterView,
        builder: (context, state) {
          return const RegisterView();
        },
      ),
    ],
  );
}
