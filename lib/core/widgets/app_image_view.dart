import 'dart:io';

import '../../config/export/export.dart';

class AppImageView extends StatelessWidget {
  ///[imagePath] is required parameter for showing image
  final String? imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final bool isAvatar, expandInOneClick;
  final BoxFit? fit;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;
  final String? placeHolderImage;

  ///a [AppImageView] it can be used for showing any type of images
  /// it will shows the placeholder image if image is not found on network image
  const AppImageView(
    this.imagePath, {
    super.key,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.expandInOneClick = true,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.isAvatar = false,
    this.placeHolderImage,
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(onTap: onTap, child: _buildCircleImage()),
    );
  }

  ///build the image with border radius
  _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  ///build the image with border and border radius style
  _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(border: border, borderRadius: radius),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svgNetwork:
          return SvgPicture.network(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
            colorFilter: color == null
                ? null
                : ColorFilter.mode(color!, BlendMode.srcIn),
          );
        case ImageType.svg:
          return SvgPicture.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
            colorFilter: color == null
                ? null
                : ColorFilter.mode(color!, BlendMode.srcIn),
          );
        case ImageType.file:
          return Image.file(
            File(imagePath!),
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
        case ImageType.webp:
          return Image.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
        case ImageType.network:
          return CachedNetworkImage(
            height: height,
            width: width,
            fit: fit ?? BoxFit.fill,
            imageUrl: imagePath!,
            color: color,
            httpHeaders: const {
              // "Authorization":
              //     "Bearer ${SharedPrefHelper.getString(AppStrings.appUserTokenKey)}",
            },
            imageBuilder: (context, imageProvider) => InkWell(
              onTap: expandInOneClick
                  ? () => imagesHeroFunction(context, imageProvider)
                  : onTap,
              // onDoubleTap: () {
              //   imagesHeroFunction(context, imageProvider);
              // },
              // onLongPress: () {
              //   imagesHeroFunction(context, imageProvider);
              // },
              child: Container(
                height: height,
                // height of the image  // height of the image
                width: width,
                // width of the image
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  border: Border.all(color: color ?? Colors.transparent),
                  borderRadius: radius,
                  shape: isAvatar == true
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: fit ?? BoxFit.fill,
                  ),
                ),
              ),
            ),
            placeholder: (context, url) => AppShimmer(avatar: isAvatar),
            errorWidget: (context, url, error) => !isAvatar
                ? SizedBox(
                    height: height,
                    width: width,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: radius ?? BorderRadius.zero,
                        child: Image.asset(
                          placeHolderImage ?? Assets.imagesPngImagePlaceholder,
                          fit: BoxFit.fill,
                          height: height,
                          width: width,
                        ),
                      ),
                    ),
                  )
                : AppShimmer(height: height, width: width, avatar: isAvatar),
          );

        case ImageType.png:
          return Image.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
        default:
          return Image.asset(
            Urls.imagePlaceholder,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
      }
    }
    return Image.asset(
      Urls.imagePlaceholder,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      color: color,
    );
  }
}

extension ImageTypeExtension on String {
  ImageType get imageType {
    if ((startsWith('http') || startsWith('https')) && endsWith('.svg')) {
      return ImageType.svgNetwork;
    } else if ((startsWith('http') || startsWith('https')) &&
        endsWith('.webp')) {
      return ImageType.network;
    } // WebP من الإنترنت
    else if (endsWith('.webp')) {
      return ImageType.webp; // WebP من الأصول المحلية
    } else if (endsWith('.avif')) {
      return ImageType.network;
    } else if (contains('http') || contains('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://') || startsWith('/data/user')) {
      return ImageType.file;
    } else if (endsWith('.png')) {
      return ImageType.png;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType {
  svg,
  png,
  network,
  file,
  unknown,
  svgNetwork,
  webp,
  placeholder,
}

Future<dynamic> imagesHeroFunction(
  BuildContext context,
  var imageProvider, {
  String? tag,
}) {
  return context.push(
    Scaffold(
      body: Hero(
        tag: tag ?? imageProvider,
        child: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image(image: imageProvider),
              ),
              PositionedDirectional(
                start: 10,
                top: 15,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(Icons.close, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
