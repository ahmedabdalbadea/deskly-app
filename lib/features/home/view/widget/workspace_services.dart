import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class WorkspaceServices extends StatelessWidget {
  const WorkspaceServices({super.key});

  final List<String> services = const ["☕", "📶", "❄️"];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        services.length,
        (index) => Container(
          margin: EdgeInsets.only(right: index < services.length - 1 ? 4 : 0),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(services[index]),
        ),
      ),
    );
  }
}
