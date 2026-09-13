import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class WorkspaceGalleryList extends StatelessWidget {
  const WorkspaceGalleryList({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      separatorBuilder: (_, _) => const SizedBox(width: 10),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: index == images.length - 1
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        images[index],
                        width: MediaQuery.widthOf(context) * 0.19,
                        height: 65,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      alignment: .center,
                      width: MediaQuery.widthOf(context) * 0.19,
                      height: 65,
                      color: Colors.black.withValues(alpha: 0.5),
                      child: Text(
                        "+8",
                        style: AppTextStyles.bold13(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                )
              : Image.asset(
                  images[index],
                  width: MediaQuery.widthOf(context) * 0.19,
                  height: 65,
                  fit: BoxFit.cover,
                ),
        );
      },
    );
  }
}
