import 'package:flutter/material.dart';

class OnboardingHeroCard extends StatelessWidget {
  const OnboardingHeroCard({
    super.key,
    required this.image,
    required this.gradient,
  });
  final String image;
  final Gradient gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            right: -40,
            child: CircleAvatar(backgroundColor: Colors.white12, radius: 80),
          ),

          Positioned(
            left: -40,
            bottom: -40,
            child: CircleAvatar(backgroundColor: Colors.white12, radius: 80),
          ),
          Image.asset(image, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
