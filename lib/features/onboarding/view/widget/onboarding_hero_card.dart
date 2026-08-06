import 'package:deskly_app/constants.dart';
import 'package:flutter/material.dart';

class OnboardingHeroCard extends StatefulWidget {
  const OnboardingHeroCard({
    super.key,
    required this.image,
    required this.gradient,
  });
  final String image;
  final Gradient gradient;

  @override
  State<OnboardingHeroCard> createState() => _OnboardingHeroCardState();
}

class _OnboardingHeroCardState extends State<OnboardingHeroCard> {
  double _circleAvatarPosition = -80;
  double _imageScale = 0.97;
  @override
  void initState() {
    super.initState();
    _forwardAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: widget.gradient,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: kAnimationDuration,
            top: _circleAvatarPosition,
            right: _circleAvatarPosition,
            child: CircleAvatar(backgroundColor: Colors.white12, radius: 80),
          ),

          AnimatedPositioned(
            duration: kAnimationDuration,
            left: _circleAvatarPosition,
            bottom: _circleAvatarPosition,
            child: CircleAvatar(backgroundColor: Colors.white12, radius: 80),
          ),
          AnimatedScale(
            duration: kAnimationDuration,
            scale: _imageScale,
            child: Image.asset(widget.image, fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }

  Future<Null> _forwardAnimation() {
    return Future.delayed(const Duration(milliseconds: 200), () {
      _circleAvatarPosition = -40;
      _imageScale = 1;
    });
  }
}
