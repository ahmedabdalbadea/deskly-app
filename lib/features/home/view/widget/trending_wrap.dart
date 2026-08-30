import 'package:flutter/material.dart';

import 'trending_item.dart';

class TrendingWrap extends StatelessWidget {
  const TrendingWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: List.generate(6, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 7.0),
          child: TrendingItem(icon: "🖥️", label: "Hot Desk"),
        );
      }),
    );
  }
}
