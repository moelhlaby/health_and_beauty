import 'dart:developer';

import '../../../config/export/export.dart';
import '../../helpers/main_function.dart';
import '../exceptions/app_exception.dart';
import '../exceptions/app_exception_extension.dart';
import '../exceptions/dio_error_handler.dart';
import 'base_consumer.dart';
import 'result.dart';

// ignore: constant_identifier_names
enum ServerMethods { GET, POST, UPDATE, DELETE, PUT, PATCH }

/// custom network call function ///
Future<Result<T>> networkCall<T>({
  required ServerMethods method,
  required String path,
  Map<String, dynamic>? params,
  Map<String, dynamic>? headers,
  dynamic body,
  required T Function(dynamic) fromJson,
  Function(Response?)? successHandler,
  Function(dynamic)? errorHandler,
}) async {
  try {
    final response = await _executeApiCall(method, path, headers, params, body);
    return _handleResponse<T>(response, fromJson, errorHandler, successHandler);
  } catch (e, s) {
    log("❌ Exception caught: $e", stackTrace: s, name: "networkCall");
    return _handleApiError(e, errorHandler);
  }
}

/// CALL API WITH METHOD ///
Future<Response<T>> _executeApiCall<T>(
  ServerMethods method,
  String path,
  Map<String, dynamic>? headers,
  Map<String, dynamic>? params,
  dynamic data,
) async {
  switch (method) {
    case ServerMethods.GET:
      return await getIt<BaseConsumer>().get<T>(
        path,
        queryParameters: params,
        headers: headers,
      );
    case ServerMethods.POST:
      return await getIt<BaseConsumer>().post<T>(
        path,
        queryParameters: params,
        data: data,
        headers: headers,
      );
    case ServerMethods.DELETE:
      return await getIt<BaseConsumer>().delete<T>(
        path,
        queryParameters: params,
        data: data,
        headers: headers,
      );
    case ServerMethods.PUT:
      return await getIt<BaseConsumer>().put<T>(
        path,
        queryParameters: params,
        data: data,
        headers: headers,
      );
    case ServerMethods.PATCH:
      return await getIt<BaseConsumer>().patch<T>(
        path,
        queryParameters: params,
        data: data,
        headers: headers,
      );
    default:
      throw UnimplementedError('Method $method is not implemented');
  }
}

/// HANDLE API RESPONSE ///
Result<T> _handleResponse<T>(
  Response? response,
  T Function(dynamic) fromJson,
  Function(dynamic)? errorHandler,
  Function(Response?)? successHandler,
) {
  if (response!.data != null && response.statusCode == 200) {
    return _handleSuccess(response, successHandler, fromJson);
  } else if (response.statusCode == 401) {
    GlobalContextExt.globalContext!.pushNamedAndRemoveUntil(
      AppRoute.loginScreen,
      predicate: (Route<dynamic> route) => false,
    );
    GlobalContextExt.globalContext!.read<AppCubit>().changeIsLogin(
      isLogin: false,
    );
    AppPreferences().clearPreferencesData();
    return appWarningAlertDialogMessage(
      title: "sessionExpired",
      context: GlobalContextExt.globalContext!,
    );
  } else {
    return _handleError(response, errorHandler);
  }
}

/// HANDLE API RESPONSE SUCCESS ///
Result<T> _handleSuccess<T>(
  Response response,
  Function(Response?)? successHandler,
  T Function(dynamic) fromJson,
) {
  successHandler?.call(response);
  final responseData = fromJson(response.data);
  return Result.success(responseData);
}

/// HANDLE API RESPONSE ERROR ///
Result<T> _handleError<T>(Response? response, Function(dynamic)? errorHandler) {
  log('API call failed with status code: $response', name: 'Error message');
  errorHandler?.call('Server error: $response');
  try {
    if (response != null) {
      if (response.data['message'] != null &&
          response.data['message'].toString().isNotEmpty) {
        log(response.data['message'] ?? '', name: 'Error     123456');
        return Result.failure(response.data['message'].toString());
      } else if (response.data['errors'] != null &&
          (response.data['errors'] as List).isNotEmpty) {
        log(response.data['message'] ?? '', name: 'message     123456');
        String errorMessage = '';
        for (var element in (response.data['errors'] as List)) {
          errorMessage += '${element['message']}\n';
        }
        return Result.failure(errorMessage);
      }
    }
    return Result.failure('Server error: ${response!.statusCode}');
  } catch (e) {
    return Result.failure('Server error: ${response!.statusCode}');
  }
}

/// HANDLE API  SUCCESS ///
Result<T> _handleApiError<T>(dynamic e, Function(dynamic)? errorHandler) {
  log('❗ Error caught in _handleApiError: ${e.toString()}', name: 'API ERROR');

  if (e is NetworkException) {
    log(e.networkErrorMessage(), name: 'Error message');
    return Result.failure(e.networkErrorMessage());
  }
  final exception = DioErrorHandler.handle(e);
  errorHandler?.call('Server error: $e');
  return Result.failure(exception.message);
}
