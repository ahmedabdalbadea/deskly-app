import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppGradients {
  static const primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primaryBlue, AppColors.primaryPurple],
  );
}
