import 'package:flutter/material.dart';

import 'search_app_bar.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [SearchAppBar()]);
  }
}
