import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:deskly_app/core/functions/app_snackbar.dart';
import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/service_locator.dart';
import 'package:deskly_app/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widget/custom_back_button.dart';
import 'widget/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterFailure) {
            AppSnackBar.showError(context, state.message);
          }

          if (state is RegisterSuccess) {
            // TODO: Navigate to home screen once home feature is implemented.
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            bool isLoading = state is RegisterLoading;

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
                      'Creating account...',
                      style: AppTextStyles.medium13(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ],
                ),
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(56),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, top: 16),
                        child: CustomBackButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  GoRouter.of(context).pop();
                                },
                        ),
                      ),
                    ),
                  ),
                  resizeToAvoidBottomInset: true,
                  body: const SafeArea(child: RegisterViewBody()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
