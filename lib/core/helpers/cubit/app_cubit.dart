import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthAndBeauty/core/constants/api_constant.dart';
import 'package:healthAndBeauty/core/theme/colors.dart';
import 'package:healthAndBeauty/core/utils/app_shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
    : super(
        AppState(
          isPass:
              (AppPreferences().getAccessToken() != null &&
              AppPreferences().getAccessToken() != ""),
        ),
      ) {
    _loadTheme();
  }

  ThemeMode get themeMode => state.isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    final newIsDark = !state.isDark;
    emit(state.copyWith(isDark: newIsDark));
    _saveTheme(newIsDark);
  }

  Future<void> _loadTheme() async {
    final savedIsDark =
        AppPreferences().getData(SharedPrefKeys.isDarkMood) ?? false;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: savedIsDark
            ? AppColors.darkBackgroundCard
            : AppColors.lightBackgroundCard,
        statusBarIconBrightness: savedIsDark
            ? Brightness.light
            : Brightness.dark,
      ),
    );
    emit(state.copyWith(isDark: savedIsDark));
  }

  Future<void> _saveTheme(bool isDark) async {
    await AppPreferences().setData(SharedPrefKeys.isDarkMood, isDark);
  }

  final NotchBottomBarController controller = NotchBottomBarController(
    index: 0,
  );

  //! ----------- Change BottomNavBar Selected Index ----------- //
  void changeBottomNavBarSelectedIndex(int index) {
    emit(state.copyWith(bottomNavBarSelectedIndex: index));
  }

  void changeIsLogin({required bool isLogin}) {
    emit(state.copyWith(isPass: isLogin));
  }
}
