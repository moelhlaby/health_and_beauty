import '../../config/export/export.dart';

class AppDecoratedContainer extends StatelessWidget {
  const AppDecoratedContainer({
    super.key,
    required this.child,
    this.borderColor,
    this.fillColor,
    this.padding,
    this.borderRadius,
    this.width,
    this.border, this.onTap, this.height,
  });

  final Widget child;
  final Color? borderColor, fillColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? width,height;
  final BoxBorder? border;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ,
        padding: padding ?? EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          border: border ?? Border.all(color: borderColor ?? Colors.transparent),
          color: fillColor ?? DynamicColors.fillColor(context),
        ),
        child: child,
      ),
    );
  }
}
