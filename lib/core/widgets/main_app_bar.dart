import '../../config/export/export.dart';

class MainAppBar extends PreferredSize {
  final double height;
  final BuildContext context;
  final bool centerTitle;
  final bool isArrowBack;
  final Color? color;
  final VoidCallback? onArrowBack;
  final TextStyle? titleStyle;
  final String title;
  final String? arrowText;

  MainAppBar({
    super.key,
    this.height = 60,
    this.arrowText,
    this.isArrowBack = true,
    this.color,
    required this.context,
    this.centerTitle = true,
    this.onArrowBack,
    this.titleStyle,
    this.title = "",
  }) : super(
         preferredSize: Size.fromHeight(height.h),
         child: AppBar(
           backgroundColor: AppColors.lightBackground,
           title: AppText(
             text: title,
             appTextStyle: titleStyle ?? TextStyles.styleH1Bold24(context),
           ),
           centerTitle: centerTitle,
           leadingWidth: 64,
           leading: isArrowBack
               ? GestureDetector(
                   onTap: () => context.pop(),
                   child: Container(
                     padding: EdgeInsets.all(12),
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: DynamicColors.fillColor(context),
                     ),
                     child: Center(
                       child: Icon(
                         Icons.arrow_back_outlined,
                         size: 22.h,
                         color: color ?? Colors.black,
                       ),
                     ),
                   ).paddingHorizontalOnly(8),
                 )
               : null,
         ),
       );
}
