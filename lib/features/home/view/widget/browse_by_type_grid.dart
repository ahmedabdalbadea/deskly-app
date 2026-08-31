import 'package:deskly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import 'browser_by_type_item.dart';

class BrowseByTypeGrid extends StatelessWidget {
  const BrowseByTypeGrid({super.key});

  final workspaceTypes = const <({String image, String label, int spaces})>[
    (image: AppImages.hotDeskImage, label: 'Hot Desk', spaces: 84),
    (image: AppImages.meetingRoomImage, label: 'Meeting Room', spaces: 32),
    (image: AppImages.privateOfficeImage, label: 'Private Office', spaces: 18),
    (image: AppImages.eventSpaceImage, label: 'Event Space', spaces: 12),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 162 / 90,
      children: List.generate(4, (index) {
        return BrowseByTypeItem(
          image: workspaceTypes[index].image,
          type: workspaceTypes[index].label,
          spaces: workspaceTypes[index].spaces,
        );
      }),
    );
  }
}
