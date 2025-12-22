import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../config/export/export.dart';
import '../helpers/cubit/pick_photo_cubit.dart';
import '../helpers/main_function.dart';

void showImageSourceSheet(
  BuildContext context,
  PickPhotoCubit cubit,
  Function(File?) onImageSelected,
) {
  customAlertDialog(
    context: context,
    hPadding: 20.w,
    vPadding: 20.h,
    marginHPadding: 20.w,
    marginVPadding: 20.h,
    content: (context) => Wrap(
      children: [
        ListTile(
          leading: Icon(Icons.camera_alt, color: AppColors.mainAppColor),
          title: const Text('Take a photo'),
          onTap: () async {
            await cubit.pickImage(ImageSource.camera);
            if (context.mounted) {
              Navigator.pop(context);
              onImageSelected(cubit.state);
            }
          },
        ),
        ListTile(
          leading: Icon(Icons.photo, color: AppColors.mainAppColor),
          title: const Text('Choose from gallery'),
          onTap: () async {
            await cubit.pickImage(ImageSource.gallery);
            if (context.mounted) {
              Navigator.of(context).pop();
              onImageSelected(cubit.state);
            }
          },
        ),
      ],
    ),
  );
}
