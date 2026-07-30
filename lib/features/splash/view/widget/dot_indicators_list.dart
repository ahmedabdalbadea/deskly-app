import 'package:deskly_app/features/splash/view/widget/dot_indicator.dart';
import 'package:flutter/material.dart';

class DotIndicatorsList extends StatefulWidget {
  const DotIndicatorsList({super.key});

  @override
  State<DotIndicatorsList> createState() => _DotIndicatorsListState();
}

class _DotIndicatorsListState extends State<DotIndicatorsList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final activeDot = (_controller.value * 3).floor() % 3;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 2 ? 0.0 : 4.0),
              child: DotIndicator(isActive: index == activeDot),
            );
          }),
        );
      },
    );
  }
}
