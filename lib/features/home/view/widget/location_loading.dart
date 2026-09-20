import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class LocationLoading extends StatelessWidget {
  const LocationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: true,
      blurEffectIntensity: 4,
      opacity: 0.25,
      progressIndicator: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(color: AppColors.primaryPurple),
          const SizedBox(height: 16),
          Text(
            'Checking location access...',
            style: AppTextStyles.medium13(
              context,
            ).copyWith(color: Colors.white),
          ),
        ],
      ),
      child: const SizedBox(),
    );
  }
}