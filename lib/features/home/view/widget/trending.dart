import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'trending_wrap.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Trending", style: AppTextStyles.bold16(context)),
        const SizedBox(height: 12),
        const TrendingWrap(),
      ],
    );
  }
}
