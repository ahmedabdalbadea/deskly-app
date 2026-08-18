import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/core/utils/app_router.dart';
import 'package:deskly_app/core/utils/form_validators.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:deskly_app/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:deskly_app/features/auth/view/widget/gradient_button.dart';
import 'package:deskly_app/features/auth/view/widget/user_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email Address", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              controller: _emailController,
              prefixIcon: AppImages.emailIcon,
              hint: "ahmed@example.com",
              validator: FormValidators.validateEmail,
            ),
          ),
          const SizedBox(height: 18),
          Text("Password", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              controller: _passwordController,
              prefixIcon: AppImages.lockIcon,
              hint: "• • • • • • • •",
              isPassword: true,
              validator: FormValidators.validatePassword,
            ),
          ),
          const SizedBox(height: 18),
          Align(
            alignment: Alignment.centerRight,
            child: Pressable(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                context.push(AppRouter.kForgotPasswordView);
              },
              radius: 0,
              child: Text(
                "Forgot Password?",
                style: AppTextStyles.medium13(
                  context,
                ).copyWith(color: AppColors.primaryPurple),
              ),
            ),
          ),
          const SizedBox(height: 18),
          GradientButton(
            title: "Sign In",
            radius: 16,
            padding: const EdgeInsets.symmetric(vertical: 16),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthCubit>().login(
                  email: _emailController.text.trim(),
                  password: _passwordController.text,
                );
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
