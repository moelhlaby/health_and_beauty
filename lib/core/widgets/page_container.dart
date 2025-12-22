import '../../config/export/export.dart';

enum StatusBarTheme { light, dark }

class PageContainer extends StatelessWidget {
  final Widget child;
  final Color? statusBarColor;
  final Color statusBarForegroundColor;
  final StatusBarTheme? statusBarTheme;
  final bool top;
  final bool bottom;
  final bool right;
  final bool left;

  const PageContainer({
    super.key,
    required this.child,
    this.statusBarColor,
    this.statusBarForegroundColor = Colors.white,
    this.statusBarTheme,
    this.top = true,
    this.bottom = false,
    this.right = true,
    this.left = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          color: statusBarColor ?? DynamicColors.background(context),
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: statusBarForegroundColor,
              statusBarIconBrightness: _android(
                statusBarTheme ??
                    (state.isDark ? StatusBarTheme.dark : StatusBarTheme.light),
              ),
              statusBarBrightness: _ios(
                statusBarTheme ??
                    (state.isDark ? StatusBarTheme.dark : StatusBarTheme.light),
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }

  Brightness _android(StatusBarTheme statusBarTheme) {
    switch (statusBarTheme) {
      case StatusBarTheme.dark:
        return Brightness.dark;
      case StatusBarTheme.light:
        return Brightness.light;
    }
  }

  Brightness _ios(StatusBarTheme statusBarTheme) {
    switch (statusBarTheme) {
      case StatusBarTheme.dark:
        return Brightness.light;
      case StatusBarTheme.light:
        return Brightness.dark;
    }
  }
}
