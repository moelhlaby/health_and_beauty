class AppApiConstants {
  static String get baseUrl =>
      'https://asser-back.aalyasser.com/Aseel/public/api/mobile/';

  static String getImageUrl(String? imagePath) {
    // remove /api from the base url
    return baseUrl.replaceAll('api/', '') + imagePath.toString();
  }
}
