import 'package:easy_localization/easy_localization.dart';

import '../../../config/export/export.dart';
import 'widgets/auth_top_section.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            10.sizeBoxH,
            AuthTopSection(title: LocaleKeys.setNewPassword.tr()),
            20.sizeBoxH,
            CustomTextField(title: LocaleKeys.enterEmail.tr()),
            40.sizeBoxH,
            AppButton(
              title: LocaleKeys.send.tr(),
              onTap: () => context.pushNamed(AppRoute.createNewPasswordView),
            ),
          ],
        ),
      ),
    );
  }
}
