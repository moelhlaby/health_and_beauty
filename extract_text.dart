// import 'dart:developer';
// import 'dart:io';
//
// void main() {
//   final directory = Directory('lib');
//   // final regex = RegExp(
//   //   r'''AppText\s*\([^\)]*text\s*:\s*['"]([^'"]+)['"]''',
//   //   multiLine: true,
//   // );
//
//     // يمسك text: "..." بس
//   final regex = RegExp(
//       r'''text\s*:\s*["\'](.+?)["\']''',
//   multiLine: true,
//   );
//   final results = <String>{};
//
//   void searchInFile(File file) {
//     final content = file.readAsStringSync();
//     for (final match in regex.allMatches(content)) {
//       results.add(match.group(1)!);
//     }
//   }
//
//   void traverseDirectory(Directory dir) {
//     for (final entity in dir.listSync(recursive: true)) {
//       if (entity is File && entity.path.endsWith('.dart')) {
//         searchInFile(entity);
//       }
//     }
//   }
//
//   traverseDirectory(directory);
//
//   if (results.isEmpty) {
//     log('❌ No strings found in AppText.');
//   } else {
//     log('✅ Strings found in AppText:\n');
//     for (final str in results) {
//       log('- "$str"');
//     }
//
//     final output = File('apptext_strings.txt');
//     output.writeAsStringSync(results.map((e) => '"$e"').join('\n'));
//     log('\n✔️ Saved to apptext_strings.txt');
//   }
// }

import 'dart:developer';
import 'dart:io';

void main() {
  final directory = Directory('lib');

  // خريطة النصوص والكِي
  final Map<String, String> translations = {
    "explore_aseer": "اكتشف معنا منطقة عسير",
    "shepherds": "الرعاة",
    "all": "الكل",
    "participants": "المشاركين",
    "yourGuide": "دليلك",
    "exhibitionsAndConferences": "المعارض والمؤتمرات",
    "entertainmentActivities": "الفاعليات الترفيهية",
    "contactUs": "تواصل معنا",
    "learnMore": "معرفة المزيد",
    "offers": "العروض",
    "exploreAseerHeritage": "نافذتك لاستكشاف جمال وتراث منطقة عسير",
    "loginToYourAccount": "تسجيل الدخول الى حسابك",
    "login": "تسجيل الدخول",
    "forgotPassword": "هل نسيت كلمة المرور؟ ",
    "clickHere": "انقر هنا",
    "continueAsGuest": "الاستمرار كزائر",
    "resetPassword": "إعادة تعيين كلمة المرور",
    "sendAnotherCode": "إرسال رمز آخر!",
    "createNewAccount": "إنشاء حساب جديد",
    "agreeToTerms": "أوافق على الشروط والأحكام!",
    "doctorTicket": "تذكرة طبيب",
    "viewImage": "عرض الصورة",
    "quantity": "العدد",
    "date": "التاريخ",
    "episodes": "الحلقات",
    "sevenMin": "7دق",
    "AseerRamadanSpecial": "عسير، رمضان الخير | حلقة خاصة",
    "AseerRamadanDescription": "في أجواء روحانية مميزة، نأخذكم في جولة خاصة داخل منطقة عسير خلال شهر رمضان المبارك، حيث تمتزج العادات والتقاليد الأصيلة بروحانية الشهر الكريم.",
    "viewsCount": "8 مشاهدات",
    "saudiGermanHospitalAseer": "مستشفى السعودي الألماني عسير",
    "ratingExcellent": "ممتاز 4.8",
    "firstEpisode": "الحلقة الأولى",
    "AseerInternationalConference": "مؤتمر عسير الدولي",
    "AseerConferenceDay1Description": "يشهد اليوم الأول 4 جلسات علمية يلقيها ...",
    "themePark": " مدينة الألعاب",
    "highCityAbha": "المدينة العالية في أبها: مدينة تتوحد فيها السماء والترفيه",
    "highCityAddress": "المدينة العالية، أبها، عسير",
    "viewMaps": "عرض الخرائط",
    "viewReceipt": "عرض الإيصال",
    "touristAttractions": "المعالم السياحية",
    "highCity": "المدينة العالية",
    "selectYourRating": "اختر تقييمك",
    "redeemPoints": "استبدال النقاط",
    "attendanceSponsor": "تسجيل الحضور كراعي/مشارك",
    "attendanceVisitor": "تسجيل الحضور كزائر",
    "pointsStore": "متجر النقاط",
    "print": "طباعة",
    "activity": "النشاط",
    "pointsCount": "عدد النقاط",
    "savePdf": "حفظ PDF",
    "hairSaoCarExhibition": "معرض هير ساو للسيارات",
    "freeCarWash": "غسيل سيارة مجاني-مغسلة هير لغسيل السيارات",
    "profile": "الملف الشخصي",
    "notifications": "الاشعارات",
    "pointsForEpisode": "20 نقطة لمشاهدة حلقة",
    "viewEpisode": "مشاهدة حلقة",
    "view": "عرض",
    "address": "العنوان",
    "phoneNumber": "رقم الهاتف",
    "fullName": "الاسم ثلاثي",
    "close": "إغلاق",
    "attendAsGuest": "حضور كزائر",
    "email": "البريد الإلكتروني",
    "password": "كلمة المرور",
    "enterCode": "أدخل الرمز",
    "sendCode": "'إرسال الرمز'",
    "continue_": "متابعة",
    "createAccount": "إنشاء حساب",
    "confirmPassword": "تأكيد كلمة المرور",
    "threeMinutesAgo": "منذ 3 دقائق",
    "greenSaudiInitiative": "مبادرة السعودية الخضراء",
    "greenSaudiInitiativeDescription": " ساهم مبادرة السعودية الخضراء بدور محوري في تحقيق أهداف المناخ العالمية. وتمهد المملكة الطريق نحو غدٍ أكثر استدامة .....",
    "redeemHistory": "سجل الاستبدال",
    "dataSaved": "تم حفظ البيانات",
    "pointsAndCollection": "النقاط وتجميعة النقاط",
    "operationNumber": "رقم العملية:",
    "validToUse": "صالح للاستخدام",
    "providerName": "اسم مزود الخدمة: المدير",
    "redeemDate": "تاريخ الاستبدال:",
    "details": "التفاصيل",
    "billsHistory": "سجل الفواتير",
    "back": "رجوع",
    "userName": "محمد عبدالله",
    "fiftyPoints": "50 نقطة",
    "logout": "تسجيل الخروج",
    "personalInformation": "المعلومات الشخصية",
    "greenInitiativeDescription2": "ساهم مبادرة السعودية الخضراء بدور محوري في تحقيق أهداف المناخ العالمية. وتمهد المملكة الطريق نحو غدٍ أكثر استدامة .....",
    "name": "الاسم",
    "company": "الشركة",
    "contactNumber": "رقم التواصل",
    "website": "الموقع الإلكتروني",
    "mobile": "الجوال",
    "profession": "المهنة",
    "passwordResetSuccess": "تم إعادة تعيين كلمة المرور",
    "book": "حجز",
    "serviceBookedSuccessfully": "تم حجز الخدمة بنجاح",
    "viewInvoice": "عرض الفاتورة",
    "confirm": "تأكيد",
    "cancel": "إلغاء",
    "home": "الرئيسية",
    "more": "المزيد",
    "youMayAlsoLike": "قد يعجبك ايضاً",
    "rateNow": "قيّم الآن",
    "submitRating": "إرسال التقييم",
    "ratingSavedSuccessfully": "تم حفظ التقييم بنجاح",
    "registerAsVisitor": "التسجيل كزائر",
    "registerAsSponsorOrParticipant": "التسجيل كراعي/مشارك",
    "contactNumbers": "أرقام التواصل",
    "youCanContactUsViaAnyNumber": "يمكنك التواصل معنا عبر أيٍ من الأرقام التالية",
    "sponsorAttendanceRegistered": "تم تسجيل الحضور كراعي / مشارك",
    "sponsorAttendance": "حضور كراعي/ مشارك",
    "visitorAttendanceRegistered": "تم تسجيل الحضور كزائر",
    "visitorAttendance": "حضور كزائر",
    "viewProducts": "عرض المنتجات",
    "services": "الخدمات",
    "requiredPoints": "النقاط المطلوبة",
    "discount": "الخصم",
    "priceBeforeDiscount": "السعر قبل الخصم",
    "price": "السعر",
    "availableTicketsCount": "عدد التذاكر المتاحة",
    "total": "الإجمالي",
    "earnedPointsWithColon": "النقاط المكتسبة:",
    "remainingPoints": "النقاط المتبقية",
    "earnedPoints": "النقاط المكتسبة"
  };

  final reverseMap = {
    for (var entry in translations.entries) entry.value.trim(): entry.key
  };

  // يمسك text: "..." بس
  final regex = RegExp(
      r'''\s*["\'](.+?)["\']''',
  multiLine: true,
  );

  void processFile(File file) {
  String content = file.readAsStringSync();
  bool modified = false;

  final newContent = content.replaceAllMapped(regex, (match) {
  final originalText = match.group(1)!.trim();
  if (reverseMap.containsKey(originalText)) {
  modified = true;
  return "LocaleKeys.${reverseMap[originalText]}.tr()";
  }
  return match.group(0)!;
  });

  if (modified) {
  file.writeAsStringSync(newContent);
  log('✅ Updated text in: ${file.path}');
  }
  }

  void traverseDirectory(Directory dir) {
  for (final entity in dir.listSync(recursive: true)) {
  if (entity is File && entity.path.endsWith('.dart')) {
  processFile(entity);
  }
  }
  }

  traverseDirectory(directory);
  log('🏁 Done replacing text in AppText.');
}
