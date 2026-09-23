import 'package:cached_network_image/cached_network_image.dart';
import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/core/widget/pressable.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.imageUrl,
    required this.userName,
    this.onPressed,
  });

  final String? imageUrl;
  final String userName;
  final VoidCallback? onPressed;

  Color _getBackgroundColor(String name) {
    const colors = [
      Color(0xFF6C47FF),
      Color(0xFF4FACFE),
      Color(0xFF00C6FF),
      Color(0xFFF59E0B),
      Color(0xFFEC4899),
      Color(0xFF8B5CF6),
      Color(0xFF10B981),
      Color(0xFFF97316),
    ];
    final hash = name.codeUnits.fold(0, (prev, element) => prev + element);
    return colors[hash % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.trim().isNotEmpty;
    final name = userName;
    final initialLetter = name[0];
    final bgColor = _getBackgroundColor(name);

    return Pressable(
      onPressed: onPressed,
      radius: 12,
      child: Container(
        width: 42,
        height: 42,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: hasImage ? Colors.transparent : bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: hasImage
            ? CachedNetworkImage(
                imageUrl: imageUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: bgColor,
                  child: Center(
                    child: Text(
                      initialLetter,
                      style: AppTextStyles.bold16(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: bgColor,
                  child: Center(
                    child: Text(
                      initialLetter,
                      style: AppTextStyles.bold16(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            : Center(
                child: Text(
                  initialLetter,
                  style: AppTextStyles.bold16(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ),
      ),
    );
  }
}
