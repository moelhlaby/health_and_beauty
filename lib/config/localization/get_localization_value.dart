import 'package:healthAndBeauty/core/extension/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalizationHelperText {
  static String getLocalizedValue(dynamic localizedData) {
    String langCode =
        EasyLocalization.of(
          navigatorKey.currentContext!,
        )?.locale.languageCode ??
        "en";
    return localizedData[langCode] ?? localizedData["en"] ?? "";
  }
}
