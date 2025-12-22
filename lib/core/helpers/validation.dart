import 'package:healthAndBeauty/core/helpers/main_function.dart';

String? validator(
  String? value,
  String? validationString,
  validationCondition,
) {
  if (validationCondition) {
    return validationString;
  }
  return null;
}

class AppValidation {
  static String? appValidation(val) => validator(
    val,
    isEnglish() ? "This field is required" : "هذا الحقل مطلوب",
    val.toString().isEmpty,
  );

  // static String? passwordValidate(val) {
  //   if (val.toString().isEmpty) {
  //     return tr(AppLocaleKey.validateEmpty);
  //   } else if (val!.length < 6) {
  //     return '';
  //   }
  //   return null;
  // }

  static String? validateIsNotEmpty(String? value) {
    if (value!.trim().isEmpty) {
      return isEnglish() ? "This field is required" : "هذا الحقل مطلوب";
    }
    return null;
  }

  static String? validateEmptyField(String? value) {
    if ((value ?? "").trim().isEmpty) {
      return isEnglish() ? "This field is required" : "هذا الحقل مطلوب";
    }
    return null;
  }

  static String? validateEmptyDropDown(dynamic value) {
    if (value == null) {
      return isEnglish() ? "YouMust select an option" : "يجب عليك اختيار خيار";
    }
    return null;
  }
}
