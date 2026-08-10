import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/core/utils/form_validators.dart';
import 'package:flutter/material.dart';

import 'gradient_button.dart';
import 'terms_and_policy.dart';
import 'user_input.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _password;
  bool _acceptedTerms = false, _acceptedTermsValidated = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Full Name", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              prefixIcon: AppImages.personIcon,
              hint: "Ahmed Mohamed",
              validator: FormValidators.requiredFieldValidator,
            ),
          ),

          const SizedBox(height: 18),

          Text("Email Address", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              prefixIcon: AppImages.emailIcon,
              hint: "ahmed@example.com",
              validator: FormValidators.validateEmail,
            ),
          ),

          const SizedBox(height: 18),

          Text("Phone Number", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              prefixIcon: AppImages.phoneIcon,
              hint: "+20 10 1234 5678",
              validator: FormValidators.validateInternationalPhone,
            ),
          ),

          const SizedBox(height: 18),

          Text("Password", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              prefixIcon: AppImages.lockIcon,
              hint: "• • • • • • • •",
              isPassword: true,
              validator: FormValidators.validatePassword,
              onChanged: (value) {
                _password = value;
              },
            ),
          ),

          const SizedBox(height: 18),

          Text("Confirm Password", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              prefixIcon: AppImages.lockIcon,
              hint: "• • • • • • • •",
              isPassword: true,
              validator: (value) =>
                  FormValidators.confirmPasswordValidator(value, _password),
            ),
          ),

          const SizedBox(height: 18),

          TermsAndPolicy(
            acceptedTerms: _acceptedTerms,
            validated: _acceptedTermsValidated,
            onChanged: (value) {
              setState(() {
                _acceptedTerms = value;
                _acceptedTermsValidated = true;
              });
            },
          ),

          const SizedBox(height: 18),

          GradientButton(
            title: "Create Account",
            radius: 16,
            padding: EdgeInsets.symmetric(vertical: 16),
            onPressed: () {
              if (_formKey.currentState!.validate() &&
                  _acceptedTermsValidated) {
                _formKey.currentState!.save();
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                  _acceptedTermsValidated = _acceptedTerms;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
