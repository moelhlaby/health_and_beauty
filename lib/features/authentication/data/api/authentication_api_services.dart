import 'package:healthAndBeauty/core/networking/models/success_model.dart';
import 'package:healthAndBeauty/core/networking/network/network_call.dart';
import 'package:healthAndBeauty/core/networking/network/result.dart';
import 'package:healthAndBeauty/features/authentication/data/api/authentication_api_constants.dart';
import 'package:healthAndBeauty/features/authentication/data/repo/authentication_repo.dart';

class AuthenticationApiServices extends AuthenticationRepo {
  @override
  Future<Result<SuccessModel>> getAuthenticationData() async {
    final data = {
      "per_page": 5,
    };
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: AuthenticationApiConstants.getAuthenticationData,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}