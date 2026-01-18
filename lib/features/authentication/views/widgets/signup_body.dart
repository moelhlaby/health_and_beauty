import 'package:easy_localization/easy_localization.dart';
import 'package:healthAndBeauty/config/export/export.dart';
import 'package:healthAndBeauty/features/authentication/views/widgets/auth_top_section.dart';


class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context,constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AuthTopSection(title: LocaleKeys.createAccount.tr()),
                  CustomTextField(title: LocaleKeys.enterEmail.tr()),
                  CustomTextField(title: LocaleKeys.enterUsername.tr()),
                  CustomTextField(title: LocaleKeys.enterPassword.tr()),
                  CustomTextField(title: LocaleKeys.confirmPassword.tr()),
                  AppButton(title: LocaleKeys.register.tr()),
                  1.sizeBoxH,
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
