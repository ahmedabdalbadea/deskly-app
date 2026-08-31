import 'package:flutter/material.dart';

import 'filter_chip_item.dart';

class FilterChipsList extends StatelessWidget {
  const FilterChipsList({super.key, required this.chips});
  final List<String> chips;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(chips.length, (index) {
          return Padding(
            padding: EdgeInsets.only(right: index == chips.length - 1 ? 0 : 6),
            child: FilterChipItem(filter: chips[index]),
          );
        }),
      ),
    );
  }
}
