import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool favorite = false;

  void _toggleFavorite() {
    setState(() {
      favorite = !favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _toggleFavorite,
      tooltip: favorite ? 'Remove from favorites' : 'Add to favorites',
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 26, minHeight: 26),
      style: IconButton.styleFrom(
        backgroundColor: favorite ? Colors.pink.shade100 : Colors.pink.shade50,
        shape: const CircleBorder(),
      ),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Icon(
          favorite ? Icons.favorite : Icons.favorite_border,
          key: ValueKey(favorite),
          size: 15,
          color: favorite ? Colors.pink.shade600 : Colors.pink.shade300,
        ),
      ),
    );
  }
}
