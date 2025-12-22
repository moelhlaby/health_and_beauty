//! -------- Gender -------- //
enum GenderEnum {
  male('This is Male'),
  female('This is Female');

  final String value;

  const GenderEnum(this.value);
}

//! -------- Merchant -------- //
enum MerchantTypeEnum {
  merchant,
  specialized,
  both,
}

//! -------- Social -------- //
enum SocialEnum { apple, google, facebook }

//! -------- Api Status -------- //
enum ApiStatus { loading, success, error }

//! -------- Api Status -------- //
enum ThemeEnum {
  light,

  dark
}

//! -------- Service Status -------- //

enum ServiceDetail { guide, landMark }

enum SponsorType {
  sponsor,
  partner,
}
