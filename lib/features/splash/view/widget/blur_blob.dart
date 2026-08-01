import 'dart:ui';

import 'package:deskly_app/constants.dart';
import 'package:flutter/material.dart';

class BlurBlob extends StatefulWidget {
  const BlurBlob({super.key, required this.color, required this.size});

  final Color color;
  final double size;

  @override
  State<BlurBlob> createState() => _BlurBlobState();
}

class _BlurBlobState extends State<BlurBlob> {
  bool appear = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        appear = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: kAnimationDuration,
      opacity: appear ? 1 : 0,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
