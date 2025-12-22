import 'dart:io';

import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math' as x;

import 'package:easy_localization/easy_localization.dart';

import '../../config/export/export.dart';

//!MARK: Function to get the  date and time format
String dateFormatMethod({
  required String dateTimeAsString,
  String? pattern,
  bool mustBeEnglish = false,
}) {
  if (dateTimeAsString.isEmpty) {
    dateTimeAsString = DateTime.now().toString();
  }
  return DateFormat(
    pattern ?? "yyyy-MM-dd HH:mm:ss",
    mustBeEnglish
        ? "en-US"
        : (EasyLocalization.of(
              GlobalContextExt.globalContext!,
            )?.currentLocale?.languageCode ??
            "en"),
  ).format(DateTime.tryParse(dateTimeAsString) ?? DateTime.now());
}

//!MARK: Function to check if the language is English
bool isEnglish() =>
    GlobalContextExt.globalContext == null
        ? AppPreferences().getLanguage() == "en"
        : (EasyLocalization.of(
                  GlobalContextExt.globalContext!,
                )?.currentLocale?.languageCode ??
                "en") ==
            "en";

//!MARK: Function to convert hex string to Color
Color hexToColor(String hexColor) {
  // Ensure the string starts with 0xFF for opacity
  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor'; // Prepend 'FF' for full opacity
  }
  return Color(int.parse(hexColor, radix: 16));
}

//!MARK:     imageHeroFunction    --------------------
Future<dynamic> imageHeroFunction(
  BuildContext context,
  var imageProvider, {
  String? tag,
}) {
  return context.push(
    Scaffold(
      body: InkWell(
        onTap: () {
          context.pop();
        },
        child: Hero(
          tag: tag ?? imageProvider,
          child: SizedBox(
            //      color: AppColors.blackColor,
            width: double.infinity,
            height: double.infinity,
            child: Image(image: imageProvider),
          ),
        ),
      ),
    ),
  );
}

//!MARK timeAgo Function -----------------------
String timeAgo(String dateTimeString) {
  DateTime now = DateTime.now();
  DateTime inputDateTime = DateTime.parse(dateTimeString);
  Duration difference = now.difference(inputDateTime);

  if (difference.inSeconds < 60) {
    return isEnglish() ? "1 minute ago" : "منذ دقيقة";
  } else if (difference.inMinutes < 60) {
    return isEnglish()
        ? "${difference.inMinutes} minutes ago"
        : "منذ ${difference.inMinutes} دقيقة";
  } else if (difference.inHours < 24 && difference.inMinutes % 60 != 0) {
    return isEnglish()
        ? "${difference.inHours} hours  ago"
        : "منذ ${difference.inHours} ساعة ";
  } else if (difference.inMinutes % 60 == 0) {
    return isEnglish()
        ? "${difference.inHours} hours ago"
        : "منذ ${difference.inHours} ساعة";
  } else if (difference.inDays < 30) {
    return isEnglish()
        ? "${difference.inDays} days ago"
        : "منذ ${difference.inDays} يوم";
  } else if (difference.inDays < 365) {
    int months = (difference.inDays / 30).floor();
    return isEnglish() ? "$months months ago" : "منذ $months شهر";
  } else {
    int years = (difference.inDays / 365).floor();
    return isEnglish() ? "$years years ago" : "منذ $years سنة";
  }
}

//!MARK: to use color random color
Color getColorForIndex(int index) {
  x.Random random = x.Random(index); // Seed random with the index
  return index == 0
      ? AppColors.mainAppColor
      : Color((random.nextDouble() * 0x276AFF).toInt()).withValues(alpha: 1.0);
}

//!MARK:  /show button model sheet ///
customBottomSheet({
  required BuildContext context,
  required Widget content,
  ScrollController? scrollController,
  double? paddingHorizontal,
  double? paddingVertical,
  bool? isDismissible,
}) {
  return showModalBottomSheet(
    showDragHandle: false,
    enableDrag: true,
    scrollControlDisabledMaxHeightRatio: 0.9,
    useSafeArea: true,
    isDismissible: isDismissible ?? true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    //  barrierColor: AppColors.withValues(alpha: 0.5),
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    builder:
        (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            // child: content.addSymmetricPadding(
            //   hVal: paddingHorizontal ?? 0.0,
            //   vVal: paddingVertical ?? 0.0,
            // ),
          ),
        ),
  );
}

///!MARK: Show Alert Dialog ///
customAlertDialog({
  required Widget Function(BuildContext) content,
  bool? barrierDismissible,
  BuildContext? context,
  double? marginHPadding,
  double? marginVPadding,
  double? radius,
  duration,
  MainAxisAlignment? mainAxisAlignment,
  double? hPadding,
  double? vPadding,
  double? width,
  Color? color,
  bool? autoPop = false,
  VoidCallback? afterPopAction,
  BoxBorder? border,
}) {
  showDialog(
    context: context ?? GlobalContextExt.globalContext!,
    barrierDismissible: barrierDismissible ?? true,
    builder: (context) {
      autoPop != false || afterPopAction != null
          ? Future.delayed(Duration(milliseconds: duration ?? 2000), () {
            if (context.mounted) {
              context.pop();
              afterPopAction?.call();
            }
          })
          : null;
      return Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        children: [
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: hPadding ?? 0.0,
              vertical: vPadding ?? 0.0,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: marginHPadding ?? 0.0,
              vertical: marginVPadding ?? 0.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 20.r),
              color: color ?? AppColors.mainAppColor,
              border: border,
            ),
            child: Material(
              color: color ?? AppColors.mainAppColor,
              child: content.call(context),
            ),
          ),
        ],
      );
    },
  );
}

//!MARK: Show Alert Dialog ///
appWarningAlertDialogMessage({
  int? type,
  required String title,
  required BuildContext context,
}) {
  return customAlertDialog(
    duration: 2000,
    width: 300.w,
    marginHPadding: 40.w,
    vPadding: 15.h,
    autoPop: true,
    barrierDismissible: false,
    content:
        (context) => Center(
          child: AppText(
            text: title,
            color: DynamicColors.backgroundInverse(context),
            textAlign: TextAlign.center,
          ).paddingSymmetric(vertical: 20.h),
        ),
  );
}

///! show toast message //
showToast({required String text, int? time, Color? color}) {
  return Fluttertoast.showToast(
    msg: text,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: time ?? 6,
    backgroundColor: color ?? AppColors.textError,
    textColor: DynamicColors.textColor(GlobalContextExt.globalContext!),
    fontSize: 16.0.sp,
    webShowClose: true,
  );
}

///!MARK: Function to obscure the middle of a string
String obscureMiddle(String input) {
  if (input.length <= 7) return input; // Not enough to obscure

  final start = input.substring(0, 3);
  final end = input.substring(input.length - 4);
  final obscuredMiddle = '*' * (input.length - 7);

  return '$start$obscuredMiddle$end';
}

//!MARK: copy to clipboard function
void copyToClipboard(BuildContext context, {required String text}) {
  Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text('Copied to clipboard')));
}

//!MARK: check if user is login first then do onTap function else show alert dialog to login first
VoidCallback? checkIfIsLoginFirst(
  BuildContext context, {
  VoidCallback? onTap,
  required bool isLogin,
}) {
  if (isLogin) {
    return onTap;
  } else {
    return () {
      customAlertDialog(
        color: AppColors.mintBlue,
        radius: 16.r,
        vPadding: 16.h,
        hPadding: 16.w,
        marginHPadding: 16.w,
        marginVPadding: 16.h,
        content: (c) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text:
                    isEnglish()
                        ? 'You need to log in first to access this feature...'
                        : 'تحتاج لتسجيل الدخول أولاً للوصول لهذه الميزة...',
                appTextStyle: TextStyles.styleH1Bold24(context),
                maxLines: 3,
              ),
              AppButton(
                title: LocaleKeys.login.tr(),
                onTap: () {
                  c.pop();
                  c.pushNamed(AppRoute.loginScreen, arguments: true).then((
                    value,
                  ) {
                    if (value == true) {
                      if (context.mounted) {
                        // HomeCubit.get(context).refreshScreen();

                        /// إذا تم تسجيل الدخول بنجاح، قم بتنفيذ onTap
                        onTap?.call();
                      }
                    }
                  });
                },
                height: 40.h,
              ),
            ],
          );
        },
      );
    };
  }
}

//!MARK: download and open pdf
Future<void> downloadAndOpenPdf(BuildContext context, String pdfUrl) async {
  try {
    // طلب صلاحية التخزين (Android <= 9)
    if (Platform.isAndroid && await Permission.storage.isDenied) {
      await Permission.storage.request();
    }

    final Dio dio = Dio();
    final Response<Uint8List> response = await dio.get<Uint8List>(
      pdfUrl,
      options: Options(responseType: ResponseType.bytes),
    );

    late String filePath;

    if (Platform.isAndroid) {
      if (await _isAndroidQorAbove()) {
        // Android 10+ → Save via MediaStore (Downloads)
        filePath = await _saveToDownloads(response.data!);
      } else {
        // Android 9 وأقل → نحفظ في /storage/emulated/0/Download
        final Directory downloadsDir = Directory(
          '/storage/emulated/0/Download',
        );
        if (!downloadsDir.existsSync()) {
          downloadsDir.createSync(recursive: true);
        }

        filePath =
            '${downloadsDir.path}/invoice_${DateTime.now().millisecondsSinceEpoch}.pdf';
        final file = File(filePath);
        await file.writeAsBytes(response.data!, flush: true);
      }
    } else {
      // iOS / Mac → نحفظ في Documents
      final Directory docsDir = await getApplicationDocumentsDirectory();
      filePath =
          '${docsDir.path}/invoice_${DateTime.now().millisecondsSinceEpoch}.pdf';
      await File(filePath).writeAsBytes(response.data!, flush: true);
    }

    if (!context.mounted) return;

    // ✅ استخرج اسم الملف من المسار
    final String fileName = filePath.split('/').last;

    // افتح الملف مباشرة بعد التحميل
    final result = await OpenFilex.open(filePath);

    if (result.type == ResultType.done) {
      // لو الملف اتفتح بنجاح → أظهر Toast بالاسم
      Fluttertoast.showToast(
        msg: "تم تحميل وفتح الملف: $fileName",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      Fluttertoast.showToast(
        msg: "تم تحميل الملف ($fileName) لكن تعذّر فتحه: ${result.message}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  } catch (e) {
    if (context.mounted) {
      Fluttertoast.showToast(
        msg: "حدث خطأ: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}

Future<bool> _isAndroidQorAbove() async =>
    Platform.isAndroid && (await _getSdkInt()) >= 29;

Future<int> _getSdkInt() async {
  return int.tryParse(
        Platform.operatingSystemVersion.split(' ').last.split('.').first,
      ) ??
      29;
}

Future<String> _saveToDownloads(Uint8List data) async {
  final String fileName =
      'invoice_${DateTime.now().millisecondsSinceEpoch}.pdf';

  final downloads = Directory('/storage/emulated/0/Download');
  final filePath = '${downloads.path}/$fileName';
  final file = File(filePath);
  await file.writeAsBytes(data, flush: true);
  return file.path;
}

//!MARK: convert number based on locale
String convertNumberBasedOnLocale(num number, BuildContext context) {
  final locale = Localizations.localeOf(context).languageCode;

  // خريطة الأرقام العربية
  const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  String numberStr = number.toString();

  if (locale == 'ar') {
    // لو اللغة عربية → نستبدل كل رقم بالمعادل العربي
    return numberStr.split('').map((char) {
      if (RegExp(r'[0-9]').hasMatch(char)) {
        return arabicDigits[int.parse(char)];
      }
      return char;
    }).join();
  } else {
    // لو اللغة مش عربية → نرجع الرقم زي ما هو
    return numberStr;
  }
}
