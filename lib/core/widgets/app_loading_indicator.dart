import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../config/export/export.dart';

class AppLoadingIndicator extends StatelessWidget {
  final Color? color;

  const AppLoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(color: color ?? AppColors.mainAppColor, size: 25.r),
    );
  }
}
