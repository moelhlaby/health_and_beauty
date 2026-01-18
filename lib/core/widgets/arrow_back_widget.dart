import '../../config/export/export.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      visualDensity: VisualDensity(vertical: -4, horizontal: -4),padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      icon: Icon(
        Icons.arrow_back_outlined,
        color: DynamicColors.textColor(context),
      ),
    );
  }
}
