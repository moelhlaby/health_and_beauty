import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double width() => MediaQuery.sizeOf(this).width;

  double height() => MediaQuery.sizeOf(this).height;

  String fontFamily() => apiTr(ar: 'Cairo', en: 'Cairo');
  String fontFamilyAr() => 'Cairo';
  String fontFamilyEn() => 'Cairo';

  String apiTr({required String ar, required String en}) {
    String text = '';
    switch (locale.languageCode) {
      case 'ar':
        text = ar;
        break;
      case 'en':
        text = en;
        break;
    }
    return text;
  }

  dynamic getByLang({required dynamic ar, required dynamic en}) {
    switch (locale.languageCode) {
      case 'ar':
        return ar;
      case 'en':
        return en;
    }
  }

  void doByLang({required VoidCallback ar, required VoidCallback en}) {
    switch (locale.languageCode) {
      case 'ar':
        ar.call();
        break;
      case 'en':
        en.call();
        break;
    }
  }

  bool isRTL() {
    return easy.Bidi.isRtlLanguage(locale.languageCode);
  }
}

/// app navigate Extension ///
extension Navigation on BuildContext {
  void _logNavigation({
    required String functionName,
    String? targetRoute,
    Object? arguments,
    Widget? targetWidget,
  }) {
    final currentRoute = ModalRoute.of(this)?.settings.name ?? 'Unknown';
    debugPrint('''
================= NAVIGATION LOG =================
Function: $functionName
Current Route: $currentRoute
Target Route: ${targetRoute ?? "N/A"}
Arguments: ${arguments ?? "N/A"}
Widget: ${targetWidget?.toString() ?? "N/A"}
==================================================
''');
  }

  Future<dynamic> push(Widget page) async {
    _logNavigation(functionName: 'push', targetWidget: page);
    return Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushNamed(
    String routeName, {
    Object? arguments,
    bool? rootNavigator,
  }) {
    _logNavigation(
      functionName: 'pushNamed',
      targetRoute: routeName,
      arguments: arguments,
    );
    return Navigator.of(
      this,
      rootNavigator: rootNavigator ?? false,
    ).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> popAndPushNamed(String routeName, {Object? arguments}) {
    _logNavigation(
      functionName: 'popAndPushNamed',
      targetRoute: routeName,
      arguments: arguments,
    );
    return Navigator.of(this).popAndPushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    _logNavigation(
      functionName: 'pushReplacementNamed',
      targetRoute: routeName,
      arguments: arguments,
    );
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> routeNavigator(Widget page, {Object? arguments}) async {
    _logNavigation(
      functionName: 'routeNavigator',
      targetWidget: page,
      arguments: arguments,
    );
    Navigator.of(
      this,
      rootNavigator: true,
    ).push(MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    RoutePredicate? predicate,
  }) {
    _logNavigation(
      functionName: 'pushNamedAndRemoveUntil',
      targetRoute: routeName,
      arguments: arguments,
    );
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate ?? (x) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> popAndPushReplacement(String routeName, {Object? arguments}) {
    _logNavigation(
      functionName: 'popAndPushReplacement',
      targetRoute: routeName,
      arguments: arguments,
    );
    Navigator.of(this).pop();
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  void pop([dynamic result]) {
    _logNavigation(functionName: 'pop');
    Navigator.of(this).pop(result);
  }

  // This will show the dialog but not block navigation
  // Future<void> expiredSession() async {
  //   Future.delayed(Duration.zero, () {
  //     showDialog(
  //       context: this,
  //       barrierDismissible: false, // prevent dialog dismissal without action
  //       builder: (context) => PopScope(
  //         canPop: false,
  //         child: AlertDialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           title: const Text("Session Expired",
  //               style: TextStyle(color: Colors.red)),
  //           content: Text(isEnglish(context)
  //               ? '👋 Your session has expired. Please log out to continue. Goodbye,! We hope to see you again soon.'
  //               : "👋 انتهت صلاحية جلستك. يُرجى تسجيل الخروج للمتابعة. وداعًا أيها! نأمل أن نراك قريبًا."),
  //           actions: [
  //             AppButton(
  //               onTap: () async {
  //                 PrefUtils.clearAllData();
  //                 PrefUtils.removeData(AppStrings.userTokenKey);
  //                 PrefUtils.removeData(AppStrings.userTokenKey);
  //                 context.pushNamedAndRemoveUntil(Routes.loginScreen,
  //                     predicate: (Route route) => false);

  //                 showToast(
  //                   text: isEnglish(context)
  //                       ? "Logged out successfully"
  //                       : "تم تسجيل الخروج بنجاح",
  //                   color: Colors.green,
  //                 );
  //               },
  //               height: 40,
  //               title: isEnglish(context) ? "Log Out" : "تسجيل الخروج",
  //             )
  //           ],
  //         ),
  //       ),
  //     );
  //   });
  // }
}

/// context extension ///
// ignore: non_constant_identifier_names
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

extension GlobalContextExt on BuildContext {
  static BuildContext? get globalContext => navigatorKey.currentContext;
}
