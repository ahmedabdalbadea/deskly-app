import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle bold38(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 38),
    fontWeight: FontWeight.bold,
  );

  static TextStyle regular14(BuildContext context) =>
      TextStyle(fontSize: getResponsiveText(context, fontSize: 14));

  static TextStyle extraBold28(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 28),
    fontWeight: FontWeight.w800,
  );

  static TextStyle regular15(BuildContext context) =>
      TextStyle(fontSize: getResponsiveText(context, fontSize: 15));

  static TextStyle semiBold13(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 13),
    fontWeight: FontWeight.w600,
  );

  static TextStyle bold15(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 15),
    fontWeight: FontWeight.w700,
  );
}

double getResponsiveText(BuildContext context, {required double fontSize}) {
  double scaledFontSize = getFontSize(context, fontSize: fontSize);
  return scaledFontSize.clamp(fontSize * 0.8, fontSize * 1.2);
}

const _designWidth = 390.0;

double getFontSize(BuildContext context, {required double fontSize}) {
  final scaleFactor = MediaQuery.widthOf(context) / _designWidth;
  return fontSize * scaleFactor;
}
