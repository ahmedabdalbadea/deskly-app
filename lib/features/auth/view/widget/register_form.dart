import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/core/utils/form_validators.dart';
import 'package:deskly_app/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _password;
  bool _acceptedTerms = false;
  bool _acceptedTermsValidated = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
          Text("Full Name", style: AppTextStyles.medium13(context)),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: UserInput(
              controller: _nameController,
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
              controller: _emailController,
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
              controller: _phoneController,
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
              controller: _passwordController,
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
            padding: const EdgeInsets.symmetric(vertical: 16),
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                  _acceptedTermsValidated = _acceptedTerms;
                });
                return;
              }

              if (!_acceptedTerms) {
                setState(() {
                  _acceptedTermsValidated = false;
                });
                return;
              }

              context.read<AuthCubit>().register(
                name: _nameController.text.trim(),
                email: _emailController.text.trim(),
                phone: _phoneController.text.trim(),
                password: _passwordController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
