import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class BrowseByTypeItem extends StatelessWidget {
  const BrowseByTypeItem({
    super.key,
    required this.image,
    required this.type,
    required this.spaces,
  });
  final String image, type;
  final int spaces;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: AspectRatio(
            aspectRatio: 162 / 90,
            child: Image.asset(image, fit: BoxFit.fill),
          ),
        ),

        Container(
          decoration: BoxDecoration(
            gradient: AppGradients.imageOverlay,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                type,
                style: AppTextStyles.bold13(
                  context,
                ).copyWith(color: Colors.white),
              ),
              Text(
                "$spaces spaces",
                style: AppTextStyles.regular11(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
