import '../../config/export/export.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final Color? background, borderColor, textColor, shadowColor;
  final Function()? onTap;
  final double? elevation, fontSize, height, width, radius;
  final EdgeInsetsGeometry? padding;
  final String? title;
  final FontWeight? fontWeight;
  final bool? hasBackgroundImage, isLoading;
  final Decoration? decoration;
  final bool inverseColor;

  // final ImageProvider<Object> image;
  const AppButton({
    super.key,
    this.onTap,
    this.child,
    this.fontWeight,
    this.textColor,
    this.width,
    this.height,
    this.background,
    this.borderColor,
    this.radius,
    this.elevation,
    this.fontSize,
    this.title,
    this.hasBackgroundImage = false,
    this.isLoading = false,
    this.inverseColor = false,
    this.shadowColor,
    this.padding,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: shadowColor ?? AppColors.mainAppColor,
        elevation: elevation ?? 0.0,
        minimumSize: Size(width ?? double.infinity, height ?? 56.h),
        padding: padding ?? EdgeInsets.zero,

        backgroundColor: inverseColor
            ? DynamicColors.border(context)
            : (background ??
                  AppColors.mainAppColor.withValues(
                    alpha: isLoading == true ? 0.7 : 1.0,
                  )),
        backgroundBuilder: (context, states, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 8.r)),
              border: Border.all(color: borderColor ?? Colors.transparent),
            ),
            child: child!,
          );
        },
        side: BorderSide(color: borderColor ?? Colors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 12.r)),
        ),
      ),
      onPressed: isLoading == true
          ? () {}
          : () {
              FocusManager.instance.primaryFocus?.unfocus();
              onTap?.call();
            },
      child:
          child ??
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading == true) ...[
                SizedBox(
                  width: 30,
                  child: AppLoadingIndicator(
                    color: inverseColor
                        ? DynamicColors.border(context)
                        : DynamicColors.textColorInverse(context),
                  ),
                ),
                10.w.horizontalSpace,
              ],
              AppText(
                textAlign: TextAlign.center,
                text: title ?? '',
                textOverflow: TextOverflow.ellipsis,
                appTextStyle: TextStyles.styleH1Bold16(
                  context,
                  color: inverseColor
                      ? AppColors.mainAppColor
                      : (textColor ?? DynamicColors.textColorInverse(context)),
                ).copyWith(fontSize: fontSize ?? 16.sp, fontWeight: fontWeight),
              ),
            ],
          ),
    );
  }
}
