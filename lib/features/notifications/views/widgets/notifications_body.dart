import 'package:healthAndBeauty/core/widgets/app_decorated_container.dart';

import '../../../../config/export/export.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  static List<Map<String, String>> notifications = [
    {
      "title": "موعد جديد",
      "content": "لديك موعد غداً الساعة 10:00 صباحاً مع المريض سارة أحمد",
      "icon": Assets.imagesCalendarTickIcon,
    },
    {
      "title": "تحديث النظام",
      "content": "لديك موعد جديد مع المريض أحمد محمد",
      "icon": Assets.imagesSmallRingIcon,
    },
    {
      "title": "دفعة جديدة",
      "content": "تم إضافة 350 ريال إلى محفظتك",
      "icon": Assets.imagesCheckmarkCircle,
    },
    {
      "title": "تحديث النظام",
      "content": "لديك موعد جديد مع المريض أحمد محمد",
      "icon": Assets.imagesSmallRingIcon,
    },
    {
      "title": "تم إلغاء الموعد",
      "content": "لقد قمت بإلغاء موعدك بنجاح مع الدكتور محمد احمد",
      "icon": Assets.imagesSmallRingIcon,
    },
  ];

  Color getFillColor(String icon) {
    switch (icon) {
      case Assets.imagesSmallRingIcon:
        return AppColors.orangeColor;
      case Assets.imagesCheckmarkCircle:
        return AppColors.green;
      case Assets.imagesCalendarTickIcon:
        return AppColors.mainAppColor;
      default:
        return AppColors.orangeColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [],
      ),
    );
  }
}
