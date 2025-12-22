import 'package:healthAndBeauty/core/helpers/bloc_observer.dart';
import 'package:healthAndBeauty/config/export/export.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> mainInits() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Future.wait<void>([ScreenUtil.ensureScreenSize(), setupGetIt()]);

  // ChuckerFlutter.showOnRelease = true;
  await AppPreferences().init();
  Bloc.observer = MyBlocObserver();
}
