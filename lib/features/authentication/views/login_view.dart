import 'package:flutter/material.dart';

import 'package:healthAndBeauty/core/widgets/app_scaffold.dart';
import 'package:healthAndBeauty/features/authentication/views/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      resizeToAvoidBottomInset: true,
      body: const LoginBody(),
    );
  }
}
