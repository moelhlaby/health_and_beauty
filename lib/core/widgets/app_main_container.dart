
import '../../config/export/export.dart';

class AppMainContainer extends StatelessWidget {
  final double? vPadding, hPadding, height, width, radius;
  final Widget? child;
  final Color? color; //Color
  final Decoration? decoration;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  const AppMainContainer({
    super.key,
    this.vPadding,
    this.hPadding,
    this.height,
    this.width,
    this.child,
    this.radius,
    this.color,
    this.decoration,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: hPadding ?? 4,
        vertical: vPadding ?? 4,
      ),
      decoration: decoration ??
          BoxDecoration(
            color: color ?? DynamicColors.borderDarkGrey(context),
            borderRadius: BorderRadius.circular(radius ?? 12.r),
            border: border,
            boxShadow: boxShadow,
          ),
      child: child,
    );
  }
}
