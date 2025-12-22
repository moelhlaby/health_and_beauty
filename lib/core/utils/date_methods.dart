import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../config/export/export.dart';
import '../extension/context_extension.dart';
import '../extension/date_time_extension.dart';
import '../helpers/main_function.dart';

class DateMethods {
  String convertDateToEnglishFormat(String inputDate) {
    const arabicToEnglish = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };

    // Step 1: Replace Arabic digits with English digits
    String englishDigits = inputDate.replaceAllMapped(
      RegExp(r'[٠-٩]'),
      (match) => arabicToEnglish[match.group(0)]!,
    );

    // Step 2: Parse into DateTime
    DateTime date = DateTime.parse(englishDigits);

    // Step 3: Format in yyyy-MM-dd
    String formatted = DateFormat('yyyy-MM-dd', 'en').format(date);

    // Step 4: Make sure only ASCII numbers are used
    formatted = formatted.replaceAllMapped(
      RegExp(r'[٠-٩]'),
      (match) => arabicToEnglish[match.group(0)]!,
    );

    return formatted;
  }

  static String formatToDate(String? date) {
    DateTime? dateTime = DateTime.tryParse(date.toString());
    return dateTime != null
        ? DateFormat('dd-MM-yyyy', 'en').format(dateTime)
        : "";
  }

  static String formatToFullData(String? date) {
    DateTime? dateTime = DateTime.tryParse(date.toString());
    return dateTime != null
        ? DateFormat(
            'dd MMMM yyyy - hh:mm a',
            GlobalContextExt.globalContext!.locale.languageCode,
          ).format(dateTime)
        : "";
  }

  static String formatToTime(String? date) {
    DateTime? dateTime = DateTime.tryParse(date.toString());
    return dateTime != null
        ? DateFormat(
            "hh:mm a",
            'en',
            // AppRouters.navigatorKey.currentContext!.locale.languageCode,
          ).format(dateTime)
        : "";
  }

  static String formatTime(String? time) {
    Map<int, String>? s = time?.split(':').asMap();

    int hours = s?.containsKey(0) == true ? int.parse(s![0]!) : 00;
    int minutes = s?.containsKey(1) == true ? int.parse(s![1]!) : 00;

    DateTime? dateTime = s != null
        ? DateTime(0000, 00, 00, hours, minutes)
        : null;
    return dateTime != null
        ? DateFormat(
            "hh:mm a",
            GlobalContextExt.globalContext!.locale.languageCode,
          ).format(dateTime)
        : "";
  }

  static bool timeBetween(String? start, String? end) {
    Map<int, String>? s = start?.split(':').asMap();

    int hoursS = s?.containsKey(0) == true ? int.parse(s![0]!) : 00;
    int minutesS = s?.containsKey(1) == true ? int.parse(s![1]!) : 00;

    Map<int, String>? e = end?.split(':').asMap();

    int hoursE = e?.containsKey(0) == true ? int.parse(e![0]!) : 00;
    int minutesE = e?.containsKey(1) == true ? int.parse(e![1]!) : 00;

    DateTime? startTime = s != null
        ? DateTime(0000, 00, 00, hoursS, minutesS)
        : null;
    DateTime? endTime = e != null
        ? DateTime(0000, 00, 00, hoursE, minutesE)
        : null;
    DateTime? nowTime = e != null
        ? DateTime(0000, 00, 00, TimeOfDay.now().hour, TimeOfDay.now().minute)
        : null;

    if (startTime != null && endTime != null) {
      if (nowTime.isBetween(startTime, endTime)!) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // static String timeAgo(String? date, BuildContext context) {
  //   DateTime? dateTime = DateTime.tryParse(date.toString());

  //   return dateTime != null
  //       ? timeago.format(dateTime, locale: context.locale.languageCode)
  //       : "";
  // }

  static int daysInMonth(final int monthNum, final int year) {
    List<int> monthLength = List.filled(12, 0);
    monthLength[0] = 31;
    monthLength[2] = 31;
    monthLength[4] = 31;
    monthLength[6] = 31;
    monthLength[7] = 31;
    monthLength[9] = 31;
    monthLength[11] = 31;
    monthLength[3] = 30;
    monthLength[8] = 30;
    monthLength[5] = 30;
    monthLength[10] = 30;

    if (leapYear(year) == true) {
      monthLength[1] = 29;
    } else {
      monthLength[1] = 28;
    }

    return monthLength[monthNum - 1];
  }

  static bool leapYear(int year) {
    bool leapYear = false;
    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true) {
      leapYear = false;
    } else if (year % 4 == 0) {
      leapYear = true;
    }

    return leapYear;
  }

  static String monthName(int month) {
    DateTime dateTime = DateTime(0, month);
    return DateFormat(
      'MMMM',
      GlobalContextExt.globalContext!.locale.languageCode,
    ).format(dateTime);
  }

  static String? weekdayName(int? weekday, BuildContext context) {
    const Map<int, String> weekdayNameEn = {
      1: "Monday",
      2: "Tuesday",
      3: "Wednesday",
      4: "Thursday",
      5: "Friday",
      6: "Saturday",
      7: "Sunday",
    };

    const Map<int, String> weekdayNameAr = {
      1: "الأثنين",
      2: "الثلاثاء",
      3: "الأربعاء",
      4: "الخميس",
      5: "الجمعه",
      6: "السبت",
      7: "الأحد",
    };
    return weekday != null
        ? context.apiTr(
            ar: weekdayNameAr[weekday] ?? "",
            en: weekdayNameEn[weekday] ?? "",
          )
        : null;
  }

  static Future<void> pickDate(
    BuildContext context, {
    required DateTime initialDate,
    DateTime? selectedDate,
    required void Function(DateTime) onSuccess,
    DateTime? firstDate,
    DateTime? lastDate,
    Color? mainColor,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
    List<DateTime>? allowedDates,
  }) async {
    DateTime focusedDay = initialDate;
    DateTime? selectedDay = selectedDate;

    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TableCalendar(
                    locale: context.locale.languageCode,
                    firstDay:
                        firstDate ??
                        DateTime.now().subtract(const Duration(days: 365 * 10)),
                    lastDay:
                        lastDate ??
                        DateTime.now().add(const Duration(days: 365 * 30)),
                    focusedDay: focusedDay,
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      disabledTextStyle: const TextStyle(color: Colors.white),
                      defaultTextStyle: const TextStyle(color: Colors.white),
                      weekendTextStyle: const TextStyle(color: Colors.white),
                      todayTextStyle: const TextStyle(color: Colors.green),
                      todayDecoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.rectangle, // ✅ أضف دي
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          bottomLeft: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                      selectedDecoration: BoxDecoration(
                        color: AppColors.mainAppColor,
                        shape: BoxShape.rectangle, // ✅ أضف دي
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          bottomLeft: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                      disabledDecoration: BoxDecoration(
                        color: AppColors.textError,
                        shape: BoxShape.rectangle, // ✅ أضف دي
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          bottomLeft: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                      weekendDecoration: BoxDecoration(
                        color: AppColors.green,
                        shape: BoxShape.rectangle, // ✅ أضف دي
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          bottomLeft: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                      holidayDecoration: BoxDecoration(
                        color: AppColors.green,
                        shape: BoxShape.rectangle, // ✅ أضف دي
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          bottomLeft: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                      defaultDecoration: BoxDecoration(
                        color: AppColors.green,
                        shape: BoxShape.rectangle, // ✅ أضف دي
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          bottomLeft: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r),
                        ),
                      ),
                      outsideTextStyle: const TextStyle(color: Colors.grey),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        color: textColor,
                        fontSize: 5,
                        fontWeight: FontWeight.bold,
                      ),
                      weekendStyle: TextStyle(
                        color: textColor,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      dowTextFormatter: (date, locale) {
                        // ✅ نخلي أسماء الأيام كاملة
                        return [
                          isEnglish() ? "Saturday" : "السبت",
                          isEnglish() ? "Sunday" : "الأحد",
                          isEnglish() ? "Monday" : "الأثنين",
                          isEnglish() ? "Tuesday" : "الثلاثاء",
                          isEnglish() ? "Wednesday" : "الأربعاء",
                          isEnglish() ? "Thursday" : "الخميس",
                          isEnglish() ? "Friday" : "الجمعه",
                        ][date.weekday % 7];
                      },
                    ),
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDay, day);
                    },
                    enabledDayPredicate: (day) {
                      if (allowedDates != null && allowedDates.isNotEmpty) {
                        return allowedDates.any(
                          (d) =>
                              d.year == day.year &&
                              d.month == day.month &&
                              d.day == day.day,
                        );
                      }
                      return true;
                    },
                    onDaySelected: (selected, focused) {
                      setState(() {
                        selectedDay = selected;
                        focusedDay = focused;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          isEnglish() ? "CANCEL" : "إلغاء",
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              mainColor ??
                              Theme.of(
                                context,
                              ).buttonTheme.colorScheme?.primary,
                        ),
                        onPressed: () {
                          if (selectedDay != null) {
                            onSuccess(selectedDay!);
                          }
                          Navigator.of(context).pop();
                        },
                        child: Text(isEnglish() ? "OK" : "موافق"),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              );
            },
          ),
        );
      },
    );
  }

  static Future<void> pickTime(
    BuildContext context, {
    required DateTime initialDate,
    required void Function(DateTime) onSuccess,
    Color? mainColor,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
  }) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: initialDate.hour,
        minute: initialDate.minute,
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: Theme(
            data: ThemeData(fontFamily: context.fontFamily()).copyWith(
              colorScheme: ColorScheme.dark(
                primary: mainColor ?? AppColors.mainAppColor,
                onPrimary: backgroundColor,
                surface: backgroundColor,
                onSurface: textColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: textColor),
              ),
              dialogTheme: DialogThemeData(backgroundColor: backgroundColor),
            ),
            child: child!,
          ),
        );
      },
    );

    if (picked != null) {
      DateTime time = DateTime(0000, 00, 00, picked.hour, picked.minute);
      onSuccess.call(time);
    }
  }
}
