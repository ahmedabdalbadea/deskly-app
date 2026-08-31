import 'package:deskly_app/constants.dart';
import 'package:flutter/material.dart';

import 'filter_chips_list.dart';

class AnimatedFilterChips extends StatelessWidget {
  const AnimatedFilterChips({super.key, required this.showChips});
  final ValueNotifier<bool> showChips;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: showChips,
      builder: (context, value, child) {
        return AnimatedSwitcher(
          duration: kAnimationDuration,
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                alignment: Alignment.topCenter,
                child: child,
              ),
            );
          },
          child: value
              ? Container(
                  key: const ValueKey('chips'),
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.only(bottom: 8),
                  child: FilterChipsList(
                    chips: ['Top Rated', 'Lowest Price', 'Most Reviewed'],
                  ),
                )
              : const SizedBox(key: ValueKey('empty')),
        );
      },
    );
  }
}
