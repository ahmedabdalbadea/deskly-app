import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/features/splash/view/widget/deskly_logo.dart';
import 'package:deskly_app/features/splash/view/widget/dot_indicators_list.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool _logoOpacityAnimation = false,
      _logoSlideAnimation = false,
      _titleAnimation = false,
      _taglineAnimation = false,
      _indicatorsAnimation = false;

  @override
  void initState() {
    super.initState();
    _forwardSequentialAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSlide(
          duration: kAnimationDuration,
          offset: _logoSlideAnimation ? Offset(0, 0) : Offset(0, 0.6),
          child: AnimatedOpacity(
            opacity: _logoOpacityAnimation ? 1 : 0,
            duration: kAnimationDuration,
            child: const DesklyLogo(),
          ),
        ),
        const SizedBox(height: 28),
        AnimatedOpacity(
          opacity: _titleAnimation ? 1 : 0,
          duration: kAnimationDuration,
          child: ShaderMask(
            shaderCallback: (bounds) {
              return AppGradients.primary.createShader(bounds);
            },
            child: Text(
              "Deskly",
              style: AppTextStyles.bold38(
                context,
              ).copyWith(color: Colors.white),
            ),
          ),
        ),

        const SizedBox(height: 6),
        AnimatedOpacity(
          opacity: _taglineAnimation ? 1 : 0,
          duration: kAnimationDuration,
          child: Text(
            "Your workspace, on demand",
            style: AppTextStyles.regular14(
              context,
            ).copyWith(color: const Color(0xff6E6E8A)),
          ),
        ),

        const SizedBox(height: 48),

        AnimatedOpacity(
          opacity: _indicatorsAnimation ? 1 : 0,
          duration: kAnimationDuration,
          child: DotIndicatorsList(),
        ),
      ],
    );
  }

  void _forwardSequentialAnimation() {
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        _logoOpacityAnimation = true;
      });
    });

    Future.delayed(Duration(milliseconds: 2640), () {
      setState(() {
        _logoSlideAnimation = true;
      });
    });

    Future.delayed(Duration(milliseconds: 3280), () {
      setState(() {
        _titleAnimation = true;
      });
    });

    Future.delayed(Duration(milliseconds: 3600), () {
      setState(() {
        _taglineAnimation = true;
      });
    });

    Future.delayed(Duration(milliseconds: 3920), () {
      setState(() {
        _indicatorsAnimation = true;
      });
    });
  }
}
