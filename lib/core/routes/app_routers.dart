import 'package:healthAndBeauty/features/onboarding/views/onboarding_view.dart';

import '../../config/export/export.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;
    switch (settings.name) {
      case AppRoute.onboardingView:
        return MaterialPageRoute(builder: (_) => OnboardingView());

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
