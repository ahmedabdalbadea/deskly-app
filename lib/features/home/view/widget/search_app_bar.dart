import 'package:deskly_app/core/utils/app_images.dart';
import 'package:deskly_app/core/widget/custom_back_button.dart';
import 'package:flutter/material.dart';

import 'custom_search_bar.dart';
import 'filter_button.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const CustomBackButton(),
          const SizedBox(width: 12),
          const Expanded(child: CustomSearchBar()),
          const SizedBox(width: 12),
          FilterButton(
            filterIcon: AppImages.adjustmentsIcon,
            size: 44,
            padding: 12,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
