import 'package:healthAndBeauty/core/networking/models/success_model.dart';
import 'package:healthAndBeauty/core/networking/network/network_call.dart';
import 'package:healthAndBeauty/core/networking/network/result.dart';
import 'package:healthAndBeauty/features/notifications/data/api/notifications_api_constants.dart';
import 'package:healthAndBeauty/features/notifications/data/repo/notifications_repo.dart';

class NotificationsApiServices extends NotificationsRepo {
  @override
  Future<Result<SuccessModel>> getNotificationsData() async {
    final data = {"per_page": 5};
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: NotificationsApiConstants.getNotificationsData,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}
