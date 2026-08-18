import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:deskly_app/core/functions/app_snackbar.dart';
import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/service_locator.dart';
import 'package:deskly_app/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:deskly_app/features/auth/view/widget/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            AppSnackBar.showError(context, state.message);
          }

          if (state is SocialAuthFailure) {
            AppSnackBar.showError(context, state.message);
          }

          if (state is SocialAuthCancelled) {
            AppSnackBar.showCancelled(context, 'Sign-in was cancelled.');
          }

          if (state is LoginSuccess || state is SocialAuthSuccess) {
            // TODO: Navigate to home screen once home feature is implemented.
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            bool isLoading =
                state is LoginLoading || state is SocialAuthLoading;

            return PopScope(
              canPop: !isLoading,
              child: BlurryModalProgressHUD(
                inAsyncCall: isLoading,
                blurEffectIntensity: 4,
                opacity: 0.4,
                progressIndicator: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(
                      color: AppColors.primaryPurple,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Signing in...',
                      style: AppTextStyles.medium13(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ],
                ),
                child: const Scaffold(
                  resizeToAvoidBottomInset: true,
                  body: SafeArea(top: false, child: LoginViewBody()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
