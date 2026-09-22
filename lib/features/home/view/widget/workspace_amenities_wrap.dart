import 'package:flutter/material.dart';

import 'workspace_amenities_item.dart';

class WorkspaceAmenitiesWrap extends StatelessWidget {
  const WorkspaceAmenitiesWrap({super.key});

  @override
  Widget build(BuildContext context) {
    const List<({IconData icon, String label})> amenities = [
      (icon: Icons.lock_outline_rounded, label: 'Secure Access'),
      (icon: Icons.coffee_outlined, label: 'Coffee Bar'),
      (icon: Icons.wifi_rounded, label: 'Fiber WiFi'),
      (icon: Icons.ac_unit_rounded, label: 'AC'),
      (icon: Icons.local_parking_outlined, label: 'Parking'),
      (icon: Icons.print_outlined, label: 'Printer'),
      (icon: Icons.videocam_outlined, label: 'Cameras'),
      (icon: Icons.kitchen_outlined, label: 'Kitchen'),
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(amenities.length, (index) {
        return WorkspaceAmenitiesItem(amenity: amenities[index]);
      }),
    );
  }
}
