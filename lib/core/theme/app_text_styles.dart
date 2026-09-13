import 'package:flutter/material.dart';

abstract class AppTextStyles {
  // Regular
  static TextStyle regular10(BuildContext context) =>
      TextStyle(fontSize: getResponsiveText(context, fontSize: 10));

  static TextStyle regular11(BuildContext context) =>
      TextStyle(fontSize: getResponsiveText(context, fontSize: 11));

  static TextStyle regular12(BuildContext context) =>
      TextStyle(fontSize: getResponsiveText(context, fontSize: 12));

  static TextStyle regular13(BuildContext context) =>
      TextStyle(fontSize: getResponsiveText(context, fontSize: 13));

  static TextStyle regular14(BuildContext context) =>
      TextStyle(fontSize: getResponsiveText(context, fontSize: 14));

  static TextStyle regular15(BuildContext context) =>
      TextStyle(fontSize: getResponsiveText(context, fontSize: 15));

  static TextStyle regular16(BuildContext context) =>
      TextStyle(fontSize: getResponsiveText(context, fontSize: 16));

  // Medium
  static TextStyle medium11(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 11),
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium12(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 12),
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium13(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 13),
    fontWeight: FontWeight.w500,
  );

  // Semi Bold
  static TextStyle semiBold10(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 10),
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold11(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 11),
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold12(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 12),
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold13(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 13),
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold20(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 20),
    fontWeight: FontWeight.w600,
  );

  // Bold
  static TextStyle bold11(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 11),
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold12(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 12),
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold13(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 13),
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold14(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 14),
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold15(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 15),
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold16(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 16),
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold22(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 22),
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold38(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 38),
    fontWeight: FontWeight.bold,
  );

  // Extra Bold
  static TextStyle extraBold11(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 11),
    fontWeight: FontWeight.w800,
  );

  static TextStyle extraBold16(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 16),
    fontWeight: FontWeight.w800,
  );

  static TextStyle extraBold17(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 17),
    fontWeight: FontWeight.w800,
  );

  static TextStyle extraBold18(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 18),
    fontWeight: FontWeight.w800,
  );

  static TextStyle extraBold22(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 22),
    fontWeight: FontWeight.w800,
  );

  static TextStyle extraBold26(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 26),
    fontWeight: FontWeight.w800,
  );

  static TextStyle extraBold28(BuildContext context) => TextStyle(
    fontSize: getResponsiveText(context, fontSize: 28),
    fontWeight: FontWeight.w800,
  );
}

double getResponsiveText(BuildContext context, {required double fontSize}) {
  final scaledFontSize = getFontSize(context, fontSize: fontSize);

  return scaledFontSize.clamp(fontSize * 0.8, fontSize * 1.2);
}

const double _designWidth = 390.0;

double getFontSize(BuildContext context, {required double fontSize}) {
  final scaleFactor = MediaQuery.widthOf(context) / _designWidth;
  return fontSize * scaleFactor;
}
