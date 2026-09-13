import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import 'workspace_gallery_list.dart';

class WorkspaceGallery extends StatelessWidget {
  const WorkspaceGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final images = const [
      AppImages.hotDeskImage,
      AppImages.meetingRoomImage,
      AppImages.privateOfficeImage,
      AppImages.eventSpaceImage,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gallery', style: AppTextStyles.bold15(context)),
        const SizedBox(height: 12),
        SizedBox(height: 65, child: WorkspaceGalleryList(images: images)),
      ],
    );
  }
}
