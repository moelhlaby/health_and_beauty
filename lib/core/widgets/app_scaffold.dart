import '../../config/export/export.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body, floatingActionButton, bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final double? horizontalPadding, verticalPadding;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const AppScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.appBar,
    this.floatingActionButtonLocation,
    this.horizontalPadding,
    this.verticalPadding,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Color(0xffFAFAFC),
      extendBody: true,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
      appBar: appBar,
      body: SafeArea(top: false, bottom: false, child: body!).paddingOnly(
        left: horizontalPadding ?? 20.w,
        right: horizontalPadding ?? 20.w,
        top: verticalPadding ?? 60.h,
        bottom: 0,
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
