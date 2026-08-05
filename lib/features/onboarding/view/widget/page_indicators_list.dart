import 'package:deskly_app/features/onboarding/view/widget/page_indicator.dart';
import 'package:flutter/material.dart';

class PageIndicatorsList extends StatelessWidget {
  const PageIndicatorsList({super.key, required this.activePage});
  final int activePage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: PageIndicator(isActive: activePage == index),
        );
      }),
    );
  }
}
