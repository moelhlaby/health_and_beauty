import '../../config/export/export.dart';

class InnerShadowContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double? padding;
  final double? margin;
  final void Function()? onTap;

  const InnerShadowContainer(
      {super.key,
      required this.child,
      this.width,
      this.height,
      this.onTap,
      this.padding,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: padding ?? 0, vertical: padding ?? 0),
            margin: EdgeInsets.symmetric(
                horizontal: margin ?? 0, vertical: margin ?? 0),
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Color(0xff214E40).withValues(alpha: 0.7),
              // الخلفية الخضراء الغامقة
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                // Top shadow
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 15.h,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white70, Colors.transparent],
                      ),
                    ),
                  ),
                ),
                // Bottom shadow
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 15.h,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(-15),
                        topLeft: Radius.circular(-15),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.white70, Colors.transparent],
                      ),
                    ),
                  ),
                ),
                // Left shadow
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  width: 15.w,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.white70, Colors.transparent],
                      ),
                    ),
                  ),
                ),
                // Right shadow
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  width: 15.w,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.white70, Colors.transparent],
                      ),
                    ),
                  ),
                ),
                child.paddingAll(15.h)
              ],
            ),
          ),
        ),
      );
    });
  }
}
