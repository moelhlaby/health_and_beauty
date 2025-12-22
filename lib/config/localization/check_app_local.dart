import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

bool isLocaleAr(BuildContext context) {
  return context.locale.languageCode == 'ar';
}

bool isDeviceLocaleAr(BuildContext context) {
  return context.deviceLocale.languageCode == 'ar';
}
