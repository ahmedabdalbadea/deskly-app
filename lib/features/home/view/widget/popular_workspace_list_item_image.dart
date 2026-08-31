import 'package:flutter/material.dart';

class PopularWorkspaceListItemImage extends StatelessWidget {
  final String image;

  const PopularWorkspaceListItemImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(12),
        topLeft: Radius.circular(12),
      ),
      child: Stack(
        children: [
          Image.asset(
            image,
            width: MediaQuery.widthOf(context) * 0.35,
            height: 135,
            fit: BoxFit.cover,
          ),

          Positioned(
            top: 5,
            left: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("🔥"),
            ),
          ),
        ],
      ),
    );
  }
}
