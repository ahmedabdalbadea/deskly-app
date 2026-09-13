import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'available_times_warp.dart';

class AvailableTimes extends StatelessWidget {
  const AvailableTimes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Available Today', style: AppTextStyles.bold15(context)),
        const SizedBox(height: 12),
        AvailableTimesWarp(),
      ],
    );
  }
}
