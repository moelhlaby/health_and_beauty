import 'package:healthAndBeauty/core/helpers/main_function.dart';

extension DateTimeExtension on DateTime? {
  bool isAfterOrEqualTo(DateTime dateTime) {
    final date = this;
    if (date != null) {
      final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
      return isAtSameMomentAs | date.isAfter(dateTime);
    }
    return false;
  }

  String dateTimeFormat({bool mustBeEnglish = false, String? pattern}) {
    final date = this;
    if (date != null) {
      return dateFormatMethod(
        dateTimeAsString: date.toString(),
        mustBeEnglish: mustBeEnglish,
        pattern: pattern,
      );
    }
    return dateFormatMethod(
      dateTimeAsString: DateTime.now().toString(),
      mustBeEnglish: mustBeEnglish,
      pattern: pattern,
    );
  }

  String dateTimeAgo() {
    final date = this;
    if (date != null) {
      return timeAgo(date.toString());
    }
    return timeAgo(DateTime.now().toString());
  }

  bool isBeforeOrEqualTo(DateTime dateTime) {
    final date = this;
    if (date != null) {
      final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
      return isAtSameMomentAs | date.isBefore(dateTime);
    }
    return false;
  }

  bool? isBetween(DateTime fromDateTime, DateTime toDateTime) {
    final date = this;
    if (date != null) {
      final isAfter = date.isAfterOrEqualTo(fromDateTime);
      final isBefore = date.isBeforeOrEqualTo(toDateTime);
      return isAfter && isBefore;
    }
    return null;
  }
}
