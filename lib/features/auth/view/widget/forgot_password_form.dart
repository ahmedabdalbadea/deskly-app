import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/core/utils/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'gradient_button.dart';
import 'user_input.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Email Address", style: AppTextStyles.medium13(context))
                .animate(delay: 400.ms)
                .fadeIn(duration: kAnimationDuration)
                .slideY(
                  begin: -0.2,
                  end: 0,
                  duration: kAnimationDuration,
                  curve: Curves.easeOut,
                ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child:
                UserInput(
                      prefixIcon: AppImages.emailIcon,
                      hint: "ahmed@example.com",
                      validator: FormValidators.validateEmail,
                    )
                    .animate(delay: 440.ms)
                    .fadeIn(duration: kAnimationDuration)
                    .slideY(
                      begin: -0.2,
                      end: 0,
                      duration: kAnimationDuration,
                      curve: Curves.easeOut,
                    ),
          ),

          const SizedBox(height: 16),

          GradientButton(
                title: "Send Reset Link",
                radius: 16,
                padding: const EdgeInsets.symmetric(vertical: 16),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              )
              .animate(delay: 480.ms)
              .fadeIn(duration: kAnimationDuration)
              .slideY(
                begin: -0.2,
                end: 0,
                duration: kAnimationDuration,
                curve: Curves.easeOut,
              ),
        ],
      ),
    );
  }
}
