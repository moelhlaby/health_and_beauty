import 'package:photo_view/photo_view.dart';
import '../../config/export/export.dart';
import '../routes/routing_argument.dart';

class ZoomImageScreen extends StatelessWidget {
  final ZoomImageArgs args;
  const ZoomImageScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        centerTitle: false,
        automaticallyImplyLeading: true,
      ),
      body: PhotoView(
        imageProvider: _imageProvider(),
        loadingBuilder: (context, event) {
          return const Center(child: AppLoadingIndicator());
        },
        // errorBuilder: (context, error, stackTrace) {
        //   return const Center(
        //     child: Image(
        //       image: AssetImage(AppImages.splashImage),
        //     ),
        //   );
        // },
      ),
    );
  }

  ImageProvider? _imageProvider() {
    if (args.imageUrl != null) {
      return NetworkImage(args.imageUrl!);
    } else if (args.imageFile != null) {
      return FileImage(args.imageFile!);
    }
    return null;
  }
}
