import 'package:easy_localization/easy_localization.dart';
import 'package:healthAndBeauty/config/export/export.dart';
import 'package:healthAndBeauty/features/authentication/views/widgets/auth_top_section.dart';

import 'auth_bottom_section.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          spacing: 12.h,
          children: [
            1.sizeBoxH,
            AuthTopSection(title: LocaleKeys.welcome.tr()),
            CustomTextField(title: LocaleKeys.enterEmail.tr()),
            CustomTextField(title: LocaleKeys.enterPassword.tr()),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: InkWell(
                onTap: ()=>context.pushNamed(AppRoute.forgetPasswordView),
                child: AppText(
                  text: LocaleKeys.forgotPassword.tr(),
                  appTextStyle: TextStyles.styleParagraphRegular16(
                    context,
                    color: AppColors.lightTextSubTitle,
                  ),
                ),
              ),
            ),
            AppButton(title: LocaleKeys.login.tr()),
            1.sizeBoxH,
            AuthBottomSection(),
          ],
        ),
      ),
    );
  }
}
