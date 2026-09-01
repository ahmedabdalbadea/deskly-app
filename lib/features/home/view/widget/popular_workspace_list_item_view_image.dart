import 'package:flutter/material.dart';

class PopularWorkspaceListItemViewImage extends StatelessWidget {
  final String image;
  final String distance;

  const PopularWorkspaceListItemViewImage({
    super.key,
    required this.image,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      ),
      child: Stack(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: MediaQuery.widthOf(context) * 0.35,
            height: 145,
          ),

          Positioned(
            bottom: 6,
            left: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '📍 $distance',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
