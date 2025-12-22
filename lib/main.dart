import 'package:easy_localization/easy_localization.dart';
import 'package:healthAndBeauty/core/app/health_and_beauty.dart';

import 'config/export/export.dart';
import 'core/app/main_inits.dart';

void main() async {
  await mainInits();

  runApp(
    EasyLocalization(
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      saveLocale: true,
      child: HealthAndBeauty(appRouter: AppRouter()),
    ),
  );
}
