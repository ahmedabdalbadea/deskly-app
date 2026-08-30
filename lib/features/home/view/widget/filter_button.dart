import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    this.onPressed,
    this.padding,
    this.size,
    this.filterIcon,
  });

  final VoidCallback? onPressed;
  final double? padding, size;
  final String? filterIcon;
  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: onPressed,
      radius: 12,
      child: Container(
        width: size ?? 30,
        height: size ?? 30,
        padding: EdgeInsets.all(padding ?? 6),
        decoration: BoxDecoration(
          gradient: AppGradients.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          filterIcon ?? AppImages.filterIcon,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
