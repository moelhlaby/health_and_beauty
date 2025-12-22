import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/export/export.dart';
import 'font_weight_helper.dart';
class TextStyles {
  static TextStyle styleH1Bold32(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: 32.sp,
        color: color ?? DynamicColors.textColor(context),
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle styleH1Bold14(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: 14.sp,
        color: color ?? DynamicColors.textColor(context),
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle styleH1Bold24(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: 24.sp,
        color: color ?? DynamicColors.textColor(context),
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle styleH1Bold25(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: 25.sp,
        color: color ?? DynamicColors.textColor(context),
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle styleH1Bold16(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: 16.sp,
        color: color ?? DynamicColors.textColor(context),
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle styleH1Bold18(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: 18.sp,
        color: color ?? DynamicColors.textColor(context),
        fontWeight: FontWeightHelper.bold,
      );
  static TextStyle styleH1Bold20(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: 20.sp,
        color: color ?? DynamicColors.textColor(context),
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle styleMedium16(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: 16.sp,
        color: color ?? DynamicColors.textColor(context),
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle styleH1Bold12(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: 12.sp,
        color: color ?? DynamicColors.textColor(context),
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle styleH1Bold10(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: 10.sp,
        color: color ?? DynamicColors.textColor(context),
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle styleSubtitleMedium14(
    BuildContext context, {
    Color? color,
  }) => TextStyle(
    fontSize: 14.sp,
    color: color ?? DynamicColors.textColor(context),
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle styleSemiBold14(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: 14.sp,
        color: color ?? DynamicColors.textColor(context),
        fontWeight: FontWeightHelper.semiBold,
      );

  static TextStyle styleSubtitleMedium12(
    BuildContext context, {
    Color? color,
  }) => TextStyle(
    fontSize: 12.sp,
    color: color ?? DynamicColors.textColor(context),
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle styleSubtitleMedium10(
    BuildContext context, {
    Color? color,
    double? height,
  }) => TextStyle(
    fontSize: 10.sp,
    color: color ?? DynamicColors.textColor(context),
    fontWeight: FontWeightHelper.medium,
    height: height,
  );

  static TextStyle styleParagraphMedium10(
    BuildContext context, {
    Color? color,
  }) => TextStyle(
    fontSize: 10.sp,
    color: color ?? DynamicColors.textColor(context),
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle styleParagraphRegular14(
    BuildContext context, {
    Color? color,
  }) => TextStyle(
    fontSize: 14.sp,
    color: color ?? DynamicColors.textColor(context),
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle styleParagraphRegular16(
    BuildContext context, {
    Color? color,
  }) => TextStyle(
    fontSize: 16.sp,
    color: color ?? DynamicColors.textColor(context),
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle styleParagraphRegular12(
    BuildContext context, {
    Color? color,
  }) => TextStyle(
    fontSize: 12.sp,
    color: color ?? DynamicColors.textColor(context),
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle styleParagraphBold16(BuildContext context, {Color? color}) =>
      TextStyle(
        fontSize: 16.sp,
        color: color ?? DynamicColors.textColor(context),
        fontWeight: FontWeightHelper.bold,
      );
}
