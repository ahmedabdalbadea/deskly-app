import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'browse_by_type_grid.dart';

class BrowseByType extends StatelessWidget {
  const BrowseByType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Browse by Type", style: AppTextStyles.bold16(context)),
        const SizedBox(height: 12),
        const BrowseByTypeGrid(),
      ],
    );
  }
}
