import 'package:healthAndBeauty/core/networking/models/success_model.dart';
import 'package:healthAndBeauty/core/networking/network/network_call.dart';
import 'package:healthAndBeauty/core/networking/network/result.dart';
import 'package:healthAndBeauty/features/profile/data/api/profile_api_constants.dart';
import 'package:healthAndBeauty/features/profile/data/repo/profile_repo.dart';

class ProfileApiServices extends ProfileRepo {
  @override
  Future<Result<SuccessModel>> getProfileData() async {
    final data = {"per_page": 5};
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: ProfileApiConstants.getProfileData,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}
