import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserInput extends StatefulWidget {
  const UserInput({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.controller,
    required this.prefixIcon,
  });
  final String hint;
  final bool isPassword;
  final String prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: widget.isPassword ? _hidePassword : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hint,
        hintStyle: AppTextStyles.regular14(
          context,
        ).copyWith(color: AppColors.mutedText),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 8),
          child: SvgPicture.asset(widget.prefixIcon),
        ),
        suffixIcon: _buildSuffixIcon(),
        suffixIconConstraints: BoxConstraints(maxWidth: 52, maxHeight: 52),
        prefixIconConstraints: BoxConstraints(maxWidth: 48, maxHeight: 48),
        border: _buildBorder(color: AppColors.border),
        enabledBorder: _buildBorder(color: AppColors.border),
        focusedBorder: _buildBorder(color: AppColors.primaryPurple),
        errorBorder: _buildBorder(color: AppColors.error),
        focusedErrorBorder: _buildBorder(color: AppColors.error),
      ),
    );
  }

  GestureDetector? _buildSuffixIcon() {
    return widget.isPassword
        ? GestureDetector(
            onTap: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: AnimatedSwitcher(
                duration: kAnimationDuration,
                reverseDuration: kAnimationDuration,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(scale: animation, child: child),
                  );
                },
                child: _hidePassword
                    ? SvgPicture.asset(key: ValueKey("eye"), AppImages.eyeIcon)
                    : SvgPicture.asset(
                        key: ValueKey("eye_off"),
                        AppImages.eyeOffIcon,
                      ),
              ),
            ),
          )
        : null;
  }

  OutlineInputBorder _buildBorder({required Color color, double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
