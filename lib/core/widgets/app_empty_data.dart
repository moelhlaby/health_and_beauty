
import '../../config/export/export.dart';

class AppEmptyData extends StatelessWidget {
  final String title;
  final Color? color;

  const AppEmptyData({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        text: title,
        color: color ?? AppColors.mainAppColor,
        textAlign: TextAlign.center,
      ).paddingVerticalOnly(20.h),
    );
  }
}
