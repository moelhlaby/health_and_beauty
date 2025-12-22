
import '../../config/export/export.dart';

class HomeScaffold extends StatelessWidget {
  final Widget? body, floatingActionButton, bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final double? horizontalPadding, verticalPadding;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const HomeScaffold({
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
      backgroundColor: backgroundColor ?? DynamicColors.background(context),
      extendBody: true,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
      body: SafeArea(
          top: false,
          bottom: false,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.35,
                // child: AppImageView(
                //   Assets.imagesBgPatternPng,
                //   height: MediaQuery.of(context).size.height,
                //   width: MediaQuery.of(context).size.width,
                // ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: AlignmentDirectional.bottomCenter,
                        end: AlignmentDirectional.topCenter)),
              ),
              body!,
            ],
          )),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
