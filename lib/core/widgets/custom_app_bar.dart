
import '../../config/export/export.dart';
import '../helpers/main_function.dart';
import 'arrow_back_widget.dart';

class CustomAppBar extends PreferredSize {
  final double height;
  final double radius;
  final double elevation;
  final List<Widget>? actions;
  final Widget? title, leading;
  final Color? appBarColor;
  final Color? shadowColor;
  final bool? centerTitle;
  final bool? isArrowBack;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final BuildContext context;
  final void Function()? onArrowBack;
  CustomAppBar(
    this.context, {
    super.key,
    this.height = 45,
    this.radius = 0,
    this.elevation = 0,
    this.actions,
    this.title,
    this.appBarColor,
    this.centerTitle,
    this.bottom,
    this.leading,
    this.shadowColor,
    this.automaticallyImplyLeading = false,
    this.isArrowBack = true,
    this.onArrowBack,
  }) : super(
         preferredSize: Size.fromHeight(height.h),
         child: AppBar(
           elevation: elevation,
           backgroundColor: appBarColor ?? DynamicColors.background(context),
           toolbarHeight: height.h,
           automaticallyImplyLeading: automaticallyImplyLeading,
           shadowColor: shadowColor,
           centerTitle: centerTitle,
           title: title,
           leading: isArrowBack == false
               ? leading
               : FittedBox(
                   child: ArrowBackWidget(onTap: onArrowBack),
                 ).paddingOnly(
                   left: isEnglish() ? 16.w : 0,
                   right: isEnglish() ? 0 : 16.w,
                 ),
           actions: actions,
           leadingWidth: 56.w,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.vertical(
               bottom: Radius.circular(radius),
             ),
           ),
           bottom: bottom,
           foregroundColor: DynamicColors.textColor(context),
         ),
       );
}
