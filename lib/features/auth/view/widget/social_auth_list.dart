import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/features/auth/domain/enums/social_auth_type.dart';
import 'package:deskly_app/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:deskly_app/features/auth/view/widget/social_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialAuthList extends StatelessWidget {
  const SocialAuthList({super.key});

  static const _socialImages = [
    AppImages.googleLogo,
    AppImages.facebookLogo,
    AppImages.linkedinLogo,
  ];

  static const _providers = [
    SocialAuthType.google,
    SocialAuthType.facebook,
    SocialAuthType.linkedin,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_socialImages.length, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: index == 2 ? 0 : 12),
            child: SocialAuthButton(
              image: _socialImages[index],
              onPressed: () {
                context.read<AuthCubit>().socialAuth(
                  provider: _providers[index],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
