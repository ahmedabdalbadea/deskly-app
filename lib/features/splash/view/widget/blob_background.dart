import 'package:flutter/material.dart';
import 'blur_blob.dart';

class BlobBackground extends StatelessWidget {
  const BlobBackground({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: const Color(0xFFF6F7FE)),

        Positioned(
          top: -120,
          right: -120,
          child: BlurBlob(color: const Color(0xFFCFE3FF), size: 270),
        ),

        Positioned(
          left: -140,
          top: MediaQuery.sizeOf(context).height * .5 - 270 / 2,
          child: BlurBlob(color: const Color(0xFFD7E6FF), size: 270),
        ),

        Positioned(
          left: -120,
          bottom: -120,
          child: BlurBlob(color: const Color(0xFFE7D9FF), size: 270),
        ),

        child!,
      ],
    );
  }
}
