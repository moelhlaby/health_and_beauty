import '../../config/export/export.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;
    switch (settings.name) {
      case AppRoute.zoomImageView:
        return MaterialPageRoute(builder: (_) => ZoomImageScreen(args: args));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: AppText(text: 'No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
