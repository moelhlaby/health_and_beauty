// ignore_for_file: public_member_api_docs, sort_constructors_first
class SuccessModel {
  bool? status;
  String? message;
  dynamic data;
  dynamic errors; // 👈 بدل ما هي List<dynamic> خليها dynamic

  SuccessModel({
    this.status,
    this.message,
    this.data,
    this.errors,
  });

  SuccessModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    result['status'] = status;
    result['message'] = message;
    result['data'] = data;
    result['errors'] = errors;
    return result;
  }

  @override
  String toString() {
    return 'SuccessModel(status: $status, message: $message, data: $data, errors: $errors)';
  }

  String errorMessage() {
    if (errors == null) return '';

    if (errors is List) {
      return (errors as List)
          .map((e) => e.toString())
          .join('\n');
    }

    if (errors is Map) {
      return (errors as Map)
          .values
          .map((e) => e.toString())
          .join('\n');
    }

    return errors.toString();
  }
}
