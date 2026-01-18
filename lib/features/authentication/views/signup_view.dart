import 'package:flutter/material.dart';

import 'package:healthAndBeauty/core/widgets/app_scaffold.dart';

import 'widgets/signup_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      resizeToAvoidBottomInset: true,
      body: const SignUpBody(),
    );
  }
}
