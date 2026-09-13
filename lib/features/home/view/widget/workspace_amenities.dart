import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'workspace_amenities_wrap.dart';

class WorkspaceAmenities extends StatelessWidget {
  const WorkspaceAmenities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Amenities', style: AppTextStyles.bold15(context)),
        const SizedBox(height: 12),
        WorkspaceAmenitiesWrap(),
      ],
    );
  }
}
