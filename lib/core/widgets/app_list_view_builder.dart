import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppListViewBuilder extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final Axis? scrollDirection;
  final double? hPadding, vPadding;
  final double? tPadding, bPadding, rPadding, lPadding;
  final Widget? separatorBuilder;

  const AppListViewBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.scrollDirection,
    this.hPadding,
    this.vPadding,
    this.separatorBuilder,
    this.tPadding,
    this.bPadding,
    this.rPadding,
    this.lPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: scrollDirection == null
          ? const NeverScrollableScrollPhysics()
          : const AlwaysScrollableScrollPhysics(),
      itemCount: itemCount,
      scrollDirection: scrollDirection ?? Axis.vertical,
      padding: tPadding != null ||
              bPadding != null ||
              rPadding != null ||
              lPadding != null
          ? EdgeInsets.only(
              top: tPadding ?? 0,
              bottom: bPadding ?? 0,
              right: rPadding ?? 0,
              left: lPadding ?? 0,
            )
          : EdgeInsets.symmetric(
              horizontal: hPadding ?? 0.0,
              vertical: vPadding ?? 10.h,
            ),
      itemBuilder: itemBuilder,
      separatorBuilder: (context, index) =>
          separatorBuilder ??
          (scrollDirection == null ? 16.h.verticalSpace : 8.w.horizontalSpace),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      cacheExtent: 50,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      shrinkWrap: true,
    );
  }
}
