import 'package:healthAndBeauty/features/authentication/views/forget_password_view.dart';
import 'package:healthAndBeauty/features/authentication/views/login_view.dart';
import 'package:healthAndBeauty/features/authentication/views/signup_view.dart';
import 'package:healthAndBeauty/features/onboarding/views/onboarding_view.dart';

import '../../config/export/export.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;
    switch (settings.name) {
      case AppRoute.onboardingView:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case AppRoute.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthenticationCubit>(),
            child: LoginView(),
          ),
        );

      case AppRoute.signUpView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthenticationCubit>(),
            child: SignUpView(),
          ),
        );

      case AppRoute.forgetPasswordView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthenticationCubit>(),
            child: ForgetPasswordView(),
          ),
        );

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
