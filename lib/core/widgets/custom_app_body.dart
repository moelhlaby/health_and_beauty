
import '../../config/export/export.dart';
import '../helpers/main_function.dart';
import '../utils/custom_shape_clipper.dart';

class CustomAppBody extends StatelessWidget {
  final Widget bodyWidget, appBarWidget;
  final EdgeInsetsGeometry bodyPadding;
  final double? appBarTopPadding, appBarBottomPadding;
  final Function()? appIconOnTap;

  const CustomAppBody({
    super.key,
    required this.bodyWidget,
    required this.appBarWidget,
    required this.bodyPadding,
    this.appBarTopPadding,
    this.appIconOnTap,
    this.appBarBottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.mainAppColor,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                appBarWidget.paddingOnly(
                  top: appBarTopPadding ?? 10.h,
                  bottom: appBarBottomPadding ?? 40.h,
                ),
                SizedBox(
                  height: 30.h,
                  child: ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: DynamicColors.textColorInverse(context),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18.r),
                          topRight: Radius.circular(18.r),
                        ),
                      ),
                    ),
                  ),
                ),
                ColoredBox(
                  color: DynamicColors.textColorInverse(
                    context,
                  ).withValues(alpha: 0.3),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: DynamicColors.textColorInverse(context),
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.r),
                        topRight: Radius.circular(18.r),
                      ),
                    ),
                    child: Padding(
                      padding: bodyPadding,
                      child: Column(children: [bodyWidget, 70.h.verticalSpace]),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 1,
              left: isEnglish() ? null : 1,
              right: isEnglish() ? 1 : null,
              child: Transform.scale(
                scaleX: isEnglish() ? -1 : 1,
                child: GestureDetector(
                  onTap: appIconOnTap,
                  child: const AppImageView(
                    //TODO: add icon
                    "AppImages.pickChanceBackgroundImage",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
