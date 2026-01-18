
import '../../../../config/export/export.dart';

class AuthTopSection extends StatelessWidget {
  const AuthTopSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppImageView(
          Assets.imagesPngHealthAndBeautyLogo,
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        AppText(
          text: title,
          appTextStyle: TextStyles.styleH1Bold32(context),
        ),
      ],
    );
  }

}
