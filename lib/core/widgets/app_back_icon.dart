
import '../../config/export/export.dart';

class AppBackIcon extends StatelessWidget {
  final Color? iconColor, backgroundColor;
  final VoidCallback? onTap;

  const AppBackIcon({
    super.key,
    this.iconColor,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => context.pop(),
      child: Icon(
        Icons.arrow_back_outlined,
        size: 24.r,
        color: iconColor ?? DynamicColors.icon(context),
        // colorFilter: ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
