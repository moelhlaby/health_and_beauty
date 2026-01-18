import 'package:easy_localization/easy_localization.dart';

import '../../../config/export/export.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        context,
        isArrowBack: true,
        centerTitle: true,
        title: AppText(
          text: LocaleKeys.newPassword.tr(),
          appTextStyle: TextStyles.styleH1Bold24(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            20.sizeBoxH,
            CustomTextField(title: LocaleKeys.enterNewPassword.tr(),),
            16.sizeBoxH,
            CustomTextField(title: LocaleKeys.confirmNewPassword.tr()),
            40.sizeBoxH,
            AppButton(title: LocaleKeys.send.tr()),
          ],
        ),
      ),
    );
  }
}
