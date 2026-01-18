import 'package:healthAndBeauty/core/networking/models/success_model.dart';
import 'package:healthAndBeauty/core/networking/network/result.dart';

abstract class AuthenticationRepo {
  //! ----------------------------- POST REQUESTS -----------------------------

  // Future<Result<AuthModel>> login({
  //   required String mobile,
  //   required String mobileCode,
  //   required String password,
  // });

  //! ----------------------------- GET REQUESTS -----------------------------
  Future<Result<SuccessModel>> getAuthenticationData();

  // Future<Result<SuccessModel>> checkCompanyUser(
  //     String companyCode, String username);

  // Future<Result<SuccessModel>> companyConfiguration(String companyCode);
}