import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/features/auth/view/widget/social_auth_button.dart';
import 'package:flutter/material.dart';

class SocialAuthList extends StatelessWidget {
  const SocialAuthList({super.key});
  final List<String> socialImages = const [
    AppImages.googleLogo,
    AppImages.facebookLogo,
    AppImages.linkedinLogo,
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: index == 2 ? 0 : 12),
            child: SocialAuthButton(image: socialImages[index]),
          ),
        );
      }),
    );
  }
}
