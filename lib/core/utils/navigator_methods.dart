import '../../config/export/export.dart';

class NavigatorMethods {
  static void showAppDialog(
    BuildContext context,
    Widget dialog, {
    bool willPop = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: willPop,
      builder: (context) {
        return PopScope(canPop: willPop, child: dialog);
      },
    );
  }

  static void showAppBottomSheet(
    BuildContext context,
    Widget bottomSheet, {
    bool willPop = true,
    bool isScrollControlled = false,
    bool enableDrag = true,
    BuildContext? builder,
  }) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: isScrollControlled,
      isDismissible: willPop,
      enableDrag: enableDrag,
      context: context,
      builder: (context) {
        return PopScope(canPop: willPop, child: bottomSheet);
      },
    );
  }

  static void loading({
    double size = 60,
    double radius = 30,
    double loadingSize = 30,
    Color? backgroundColor,
    Color? loadingColor,
  }) {
    FocusScope.of(GlobalContextExt.globalContext!).requestFocus(FocusNode());
    BotToast.showCustomLoading(
      toastBuilder: (cancelFunc) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color:
              backgroundColor ??
              DynamicColors.background(GlobalContextExt.globalContext!),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: const Center(child: AppLoadingIndicator()),
      ),
    );
  }

  static void loadingOff() {
    BotToast.closeAllLoading();
  }
}
