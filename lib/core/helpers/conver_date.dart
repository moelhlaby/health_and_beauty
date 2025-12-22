//! Convert date from 2025-07-09 16:00:00 to 03/07/2025 10:30Am
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';

convertDate(String date) {
  DateTime dateParsed = DateTime.parse(date);

  String formatted = DateFormat('dd/MM/yyyy hh:mma').format(dateParsed);
  return formatted;
}

  DateTime tryParseStringToDateOrReturnToday(String dateString) {
    try {
      // Try parsing with the expected format first
      return DateFormat('yyyy-MM-dd').parse(dateString);
    } catch (e) {
      try {
        // Try parsing with DateTime.parse as fallback
        return DateTime.parse(dateString);
      } catch (e) {
        // If all parsing fails, return current date as fallback
        log('Error parsing date: $dateString, using current date as fallback');
        return DateTime.now();
      }
    }
  }