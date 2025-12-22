import 'package:healthAndBeauty/core/helpers/main_function.dart';
import 'package:flutter/material.dart';

extension PaddingExtensions on Widget {
  /// Adds symmetric padding
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  /// Adds all sides padding
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Adds vertical padding only
  Widget paddingVerticalOnly(double value) => Padding(
    padding: EdgeInsets.symmetric(vertical: value),
    child: this,
  );

  /// Adds horizontal padding only
  Widget paddingHorizontalOnly(double value) => Padding(
    padding: EdgeInsets.symmetric(horizontal: value),
    child: this,
  );

  /// Adds only specific sides padding
  Widget paddingOnly({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    ),
    child: this,
  );

  /// Adds only specific sides padding
  Widget paddingOnlyDirectional({
    double end = 0,
    double start = 0,
    double top = 0,
    double bottom = 0,
  }) => Padding(
    padding: EdgeInsetsDirectional.only(
      end: end,
      start: start,
      top: top,
      bottom: bottom,
    ),
    child: this,
  );
}

extension NumExtensions on num {
  String getRatingText() {
    if (this >= 9 && this <= 10) {
      return isEnglish() ? 'Excellent' : 'ممتاز';
    } else if (this >= 7 && this < 9) {
      return isEnglish() ? 'Very Good' : 'جيد جداً';
    } else if (this >= 5 && this < 7) {
      return isEnglish() ? 'Good' : 'مقبول';
    } else if (this >= 3 && this < 5) {
      return isEnglish() ? 'Bad' : 'ضعيف';
    } else if (this > 0 && this < 3) {
      return isEnglish() ? 'Very Bad' : 'سيء جداً';
    } else if (this == 0) {
      return isEnglish() ? 'Not Yet Rated' : 'لم تقيَم';
    } else {
      return isEnglish() ? 'Unknown Rate' : 'تقييم غير معروف';
    }
  }
}
