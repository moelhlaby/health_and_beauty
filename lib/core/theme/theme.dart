import '../../config/export/export.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    fontFamily: 'Cairo',
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppColors.mainAppColor,
      selectionHandleColor: AppColors.mainAppColor,
      cursorColor: AppColors.mainAppColor,
    ),
    colorScheme: const ColorScheme.light(
      surface: AppColors.lightBackground,
      onSurface: AppColors.darkBackground,
      primary: AppColors.lightPrimary,
      onPrimary: AppColors.textLight,
      secondary: AppColors.textParaLight,
      onSecondary: AppColors.borderLight,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.lightPrimary),
    iconTheme: const IconThemeData(color: AppColors.lightIcons),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    fontFamily: 'Cairo',
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppColors.mainAppColor,
      selectionHandleColor: AppColors.mainAppColor,
      cursorColor: AppColors.mainAppColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.darkIcons),
    colorScheme: const ColorScheme.dark(
      surface: AppColors.darkBackground,
      onSurface: AppColors.lightBackground,
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.textDark,
      secondary: AppColors.textParaDark,
      onSecondary: AppColors.borderDark,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkPrimary),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
