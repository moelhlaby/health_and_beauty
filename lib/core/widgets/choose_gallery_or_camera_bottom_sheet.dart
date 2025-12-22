
import '../../config/export/export.dart';
import '../helpers/main_function.dart';

class ChooseGalleryOrCameraBottomSheet extends StatelessWidget {
  final void Function()? onCamera;
  final void Function()? onGallery;
  const ChooseGalleryOrCameraBottomSheet({
    super.key,
    this.onCamera,
    this.onGallery,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DynamicColors.textColorInverse(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          SizedBox(
            width: 40,
            child: Divider(color: DynamicColors.textSubtitle(context)),
          ),
          const SizedBox(height: 15),
          Flexible(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextButton(
                    onPressed: onCamera,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          //TODO: add icon
                          "AppImages.cameraIcon",
                          colorFilter: ColorFilter.mode(
                            AppColors.mainAppColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          isEnglish() ? "Camera" : "الكاميرا",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: DynamicColors.textSubtitle(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: DynamicColors.divider(context)),
                  TextButton(
                    onPressed: onGallery,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          //TODO: add icon
                          "AppImages.galleryIcon",
                          colorFilter: ColorFilter.mode(
                            AppColors.mainAppColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          isEnglish() ? "Gallery" : "المعرض",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: DynamicColors.textSubtitle(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
