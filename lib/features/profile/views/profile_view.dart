import 'package:easy_localization/easy_localization.dart';
import 'package:healthAndBeauty/config/export/export.dart';

import 'package:healthAndBeauty/features/profile/views/widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      appBar: MainAppBar(
        context: context,
        centerTitle: true,
        title: "LocaleKeys.profile.tr()",
        isArrowBack: false,
      ),
      body: const ProfileBody(),
    );
  }
}
