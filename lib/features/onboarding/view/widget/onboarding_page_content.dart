import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

import 'onboarding_hero_card.dart';

class OnboardingPageContent extends StatefulWidget {
  const OnboardingPageContent({super.key, required this.item});
  final OnboardingModel item;

  @override
  State<OnboardingPageContent> createState() => _OnboardingPageContentState();
}

class _OnboardingPageContentState extends State<OnboardingPageContent> {
  double _titleOpacity = 0, _descriptionOpacity = 0;
  Offset _titleOffset = const Offset(0, 0.12),
      _descriptionOffset = const Offset(0, 0.12);

  @override
  void initState() {
    super.initState();
    _forwardAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: OnboardingHeroCard(
            image: widget.item.image,
            gradient: widget.item.gradient,
          ),
        ),
        const SizedBox(height: 36),

        AnimatedSlide(
          duration: kAnimationDuration,
          offset: _titleOffset,
          child: AnimatedOpacity(
            duration: kAnimationDuration,
            opacity: _titleOpacity,
            child: Text(
              widget.item.title,
              style: AppTextStyles.extraBold28(context),
              maxLines: 2,
            ),
          ),
        ),
        const SizedBox(height: 12),
        AnimatedSlide(
          duration: kAnimationDuration,
          offset: _descriptionOffset,
          child: AnimatedOpacity(
            duration: kAnimationDuration,
            opacity: _descriptionOpacity,
            child: Text(
              widget.item.description,
              style: AppTextStyles.regular15(
                context,
              ).copyWith(color: const Color(0xff6E6E8A)),
            ),
          ),
        ),
      ],
    );
  }

  void _forwardAnimation() {
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        _titleOpacity = 1;
        _titleOffset = Offset(0, 0);
      });
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        _descriptionOpacity = 1;
        _descriptionOffset = Offset(0, 0);
      });
    });
  }
}
