import 'package:easy_localization/easy_localization.dart';

import '../../../config/export/export.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final imagesList = [
          Assets.imagesPngOnboarding1,
          Assets.imagesPngOnboarding2,
          Assets.imagesPngOnboarding3,
          Assets.imagesPngOnboarding4,
        ],
        titlesList = [
          LocaleKeys.healthcareDescription.tr(context: context),
          LocaleKeys.fitnessPlansDescription.tr(context: context),
          LocaleKeys.exclusiveCollectionsDescription.tr(context: context),
          LocaleKeys.beautyProductsDescription.tr(context: context),
        ],
        buttonTitlesList = [
          LocaleKeys.letsStart.tr(context: context),
          LocaleKeys.next.tr(context: context),
          LocaleKeys.next.tr(context: context),
          LocaleKeys.next.tr(context: context),
        ];
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
      body: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          AnimatedContainer(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            duration: Duration(milliseconds: 400),
            child: AppImageView(imagesList[selectedIndex], fit: BoxFit.cover),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white.withValues(alpha: 0)],
                stops: [0.7, 1],
                end: AlignmentGeometry.topCenter,
                begin: AlignmentGeometry.bottomCenter,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                AppText(
                  text: titlesList[selectedIndex],
                  appTextStyle: TextStyles.styleH1Bold24(context),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                AppButton(
                  title: buttonTitlesList[selectedIndex],
                  onTap: selectedIndex == imagesList.length-1
                      ? () => context.pushNamedAndRemoveUntil(
                          AppRoute.loginScreen,
                        )
                      : () => setState(() {
                          selectedIndex = selectedIndex + 1;
                        }),
                ),
              ],
            ).paddingOnly(left: 24.w, right: 24.w, bottom: 30.h),
          ),
        ],
      ),
    );
  }
}
