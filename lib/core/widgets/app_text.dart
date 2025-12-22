import '../../config/export/export.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final bool mustShowAsEnglish;
  final Color? color;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextDecoration? decoration;
  final TextDirection? textDirection;
  final TextStyle? appTextStyle;
  final VoidCallback? onTap;

  const AppText({
    super.key,
    required this.text,
    this.textAlign,
    this.color,
    this.maxLines,
    this.textOverflow,
    this.decoration,
    this.textDirection,
    this.appTextStyle,
    this.mustShowAsEnglish = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textDirection: mustShowAsEnglish ? TextDirection.ltr : null,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines ?? 10,
        overflow: textOverflow ?? TextOverflow.ellipsis,
        softWrap: true,
        style:
            appTextStyle?.copyWith(color: color) ??
            TextStyles.styleParagraphRegular14(context, color: color),
      ),
    );
  }
}
