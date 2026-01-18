import 'package:easy_localization/easy_localization.dart';
import 'package:healthAndBeauty/core/helpers/main_function.dart';

import '../../../../config/export/export.dart';

class AuthBottomSection extends StatelessWidget {
  const AuthBottomSection({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(height: 1, color: const Color(0xff243C70)),
            ),
            AppText(
              text: isEnglish() ? ' or ' : ' أو ',
              color: const Color(0xff243C70),
              appTextStyle: TextStyles.styleParagraphRegular16(context),
            ),
            Expanded(
              child: Container(height: 1, color: const Color(0xff243C70)),
            ),
          ],
        ),
        _buildLoginButton(
          context,
          icon: Assets.imagesSvgGmailIcon,
          title: "${LocaleKeys.loginWithAccount.tr()} Google",
        ),
        _buildLoginButton(
          context,
          icon: Assets.imagesSvgAppleIcon,
          title: "${LocaleKeys.loginWithAccount.tr()} Apple",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: LocaleKeys.noAccount.tr(),
              appTextStyle: TextStyles.styleMedium16(context),
            ),
            4.sizeBoxW,
            InkWell(
              onTap: () => context.pushNamed(AppRoute.signUpView),
              child: AppText(
                text: LocaleKeys.register.tr(),
                appTextStyle: TextStyles.styleMedium16(
                  context,
                  color: AppColors.mainAppColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoginButton(
    BuildContext context, {
    void Function()? onTap,
    required String icon,
    required String title,
  }) {
    return AppButton(
      onTap: onTap,
      background: AppColors.lightBackground,
      borderColor: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImageView(icon, height: 20.h, width: 20.w),
          4.sizeBoxW,
          AppText(
            text: title,
            appTextStyle: TextStyles.styleParagraphRegular16(context),
          ),
        ],
      ),
    );
  }
}
