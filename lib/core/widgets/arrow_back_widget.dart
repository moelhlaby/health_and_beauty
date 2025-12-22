
import '../../config/export/export.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            context.pop();
          },
      child: Container(
        margin: EdgeInsets.all(5.w),
        height: 32.h,
        width: 32.w,
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white38,
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 20.r,
          color: DynamicColors.textColorInverse(context),
        ),
      ),
    );
  }
}
