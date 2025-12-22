part of 'app_cubit.dart';

class AppState {
  final bool isPass;
  final int bottomNavBarSelectedIndex;
  final bool isDark;

  AppState({
    required this.isPass,
    this.bottomNavBarSelectedIndex = 0,
    this.isDark = false,
  });

  AppState copyWith({
    bool? isPass,
    int? bottomNavBarSelectedIndex,
    bool? isDark,
  }) {
    return AppState(
      isDark: isDark ?? this.isDark,
      isPass: isPass ?? this.isPass,
      bottomNavBarSelectedIndex:
          bottomNavBarSelectedIndex ?? this.bottomNavBarSelectedIndex,
    );
  }
}
