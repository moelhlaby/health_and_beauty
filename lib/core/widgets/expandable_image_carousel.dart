
import '../../config/export/export.dart';

class ExpandableImageCarousel extends StatefulWidget {
  const ExpandableImageCarousel({
    super.key,
    this.background,
    this.borderColor,
    this.height,
    this.width,
    required this.images,
    this.onImageTap,
  });

  final Color? background;
  final Color? borderColor;
  final double? height;
  final double? width;
  final List<dynamic>? images;
  final void Function(int index, String image)? onImageTap;

  @override
  State<ExpandableImageCarousel> createState() =>
      _ExpandableImageCarouselState();
}

class _ExpandableImageCarouselState extends State<ExpandableImageCarousel>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  int selectedImage = 0;

  final ScrollController _scrollController = ScrollController();

  // void _toggleExpand() {
  //   setState(() {
  //     _isExpanded = !_isExpanded;
  //   });
  // }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 150,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 150,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isExpanded ? 130 : (widget.height ?? 60),
        width: widget.width,
        padding: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: widget.background ?? Colors.black38,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: _scrollLeft,
              child: Icon(
                Icons.arrow_back_ios,
                size: 20.h,
                color: Colors.white,
              ),
            ).paddingHorizontalOnly(8.w),
            Expanded(
              child: ListView.separated(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.images?.length ?? 0,
                separatorBuilder: (_, __) => 10.sizeBoxW,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedImage = index;
                        });

                        final img = widget.images?[index];
                        String path;

                        if (img is String) {
                          path = img; // لو String مباشرة (URL أو Local path)
                        } else if (img.image != null) {
                          path = img.image; // لو Object فيه image
                        } else {
                          path = 'https://'; // fallback
                        }
                        widget.onImageTap?.call(index, path);
                      },
                      child: AppImageView(
                        (() {
                          final img = widget.images?[index];
                          if (img is String) {
                            return img;
                          } else if (img.image != null) {
                            return img.image;
                          }
                          return 'https://';
                        })(),
                        fit: BoxFit.cover,
                        expandInOneClick: false,
                        border: Border.all(
                          color:
                              selectedImage == index
                                  ? AppColors.mainAppColor
                                  : DynamicColors.textColorInverse(context),
                        ),
                        radius: BorderRadius.circular(2),
                      ),
                    ),
                  ).paddingVerticalOnly(4);
                },
              ),
            ),
            InkWell(
              onTap: _scrollRight,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20.h,
                color: Colors.white,
              ),
            ).paddingHorizontalOnly(8.w),
          ],
        ),
      ),
    );
  }
}
