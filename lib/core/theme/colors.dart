import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  // light colors
  static const Color lightBackground = Color(0xFFFAFAFC);
  static const Color borderLight = Color(0xFFFFFFFF);
  static const Color fillColorLight = Color(0xFFFFFFFF);
  static const Color buttonFillLight = Color(0xFFE9F0FF);
  static const Color textLight = Color(0xFF000000);
  static const Color lightPrimary = Color(0xFFFDFDFD);
  static const Color lightBackgroundCard = Color(0xFFFDFDFD);
  static const Color textParaLight = Color(0xFF626467);
  static const Color borderDarkGreyL = Color(0xFFB0B1B3);
  static const Color lightBorderMediumGray = Color(0xFFE5E5E6);
  static const Color lightIconsParagraph = Color(0xFF626467);
  static const Color lightIconsMenu = Color(0xFF626467);
  static const Color lightIcons = Color(0xFF252527);
  static const Color lightTextSubTitle = Color(0xFF666666);
  static const Color dividerLight = Color(0xFFE5E7EB);
  static const Color borderRegularLight = Color(0xFFF2F2F2);

  // dark colors
  static const Color darkBackground = Color(0xFF181922);
  static const Color borderDark = Color(0xFFD1D5DB);
  static const Color fillColorDark = Color(0xFFFFFFFF);
  static const Color buttonFillDark = Color(0xFFE9F0FF);
  static const Color textDark = Color(0xFFF2F2F2);
  static const Color darkPrimary = Color(0xFF20212E);
  static const Color darkBackgroundCard = Color(0xFF20212E);
  static const Color borderGreyDark = Color(0xFF7B7D81);
  static const Color textParaDark = Color(0xFFCACBCD);
  static const Color borderDarkGreyD = Color(0xFF4A4B4D);
  static const Color darkBorderMediumGray = Color(0xFF7B7D81);
  static const Color darkIconsParagraph = Color(0xFFCACBCD);
  static const Color darkIconsMenu = Color(0xFF858699);
  static const Color darkIcons = Color(0xFFF2F2F2);
  static const Color darkTextSubTitle = Color(0xFFD7D8D9);
  static const Color dividerDark = Color(0xFF313234);
  static const Color borderRegularDark = Color(0xFF7B7D81);

  // other colors
  static const Color textWhite = Color(0xFFFDFDFD);
  static const Color textGreyed = Color(0xFF7D8A95);
  static const Color mainAppColor = Color(0xFFA3B8A5);
  static const Color secondAppColor = Color(0xFFD8B4B4);
  static const Color cardBackground = Color(0xFFFDFDFD);
  static const Color disabled = Color(0xFF95979A);
  static const Color icon = Color(0xFF7D8A95);
  static const Color textError = Color(0xFFFC2F20);
  static const Color star = Color(0xFFEDBA4A);
  static const Color waitingColor = Color(0xFFFFA726);
  static const Color orangeColor = Color(0xFFFF9500);
  static const Color confirmedColor = Color(0xff28C76F);
  static const Color green = Color(0xFF4FC33D);
  static const Color darkGreen = Color(0xff116A77);
  static const Color grey = Color(0xFF7D8A95);
  static const Color lightGrey = Color(0xFFD1D5DB);

  static const Color buttonBg = Color(0xFF7D8A95);
  static const Color bg = Color(0xffF4F4F6);

  static const Color deepBlue = Color(0xFF201C59);
  static const Color mintBlue = Color(0xFFD0E3FB);
  static const LinearGradient appGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Color(0xFFD0E3FB), Color(0xFF0C448D)],
  );
  static const List<Color> gradientColors = [
    Color(0xFFD0E3FB),
    Color(0xFF0C448D),
  ];
}

abstract class DynamicColors {
  DynamicColors._();

  static Color getColor(BuildContext context, Color light, Color dark) {
    return Theme.of(context).brightness == Brightness.light ? light : dark;
  }

  static Color background(BuildContext context) {
    return getColor(
      context,
      AppColors.lightBackground,
      AppColors.darkBackground,
    );
  }

  static Color backgroundInverse(BuildContext context) {
    return getColor(
      context,
      AppColors.darkBackground,
      AppColors.lightBackground,
    );
  }

  static Color backgroundCard(BuildContext context) {
    return getColor(
      context,
      AppColors.lightBackgroundCard,
      AppColors.darkBackgroundCard,
    );
  }

  static Color backgroundCardInverse(BuildContext context) {
    return getColor(
      context,
      AppColors.darkBackgroundCard,
      AppColors.lightBackgroundCard,
    );
  }

  static Color textColor(BuildContext context) {
    return getColor(context, AppColors.textLight, AppColors.textDark);
  }

  static Color fillColor(BuildContext context) {
    return getColor(context, AppColors.fillColorLight, AppColors.fillColorDark);
  }

  static Color textColorInverse(BuildContext context) {
    return getColor(context, AppColors.textDark, AppColors.textLight);
  }

  static Color textSubtitle(BuildContext context) {
    return getColor(
      context,
      AppColors.lightTextSubTitle,
      AppColors.darkTextSubTitle,
    );
  }

  static Color textFieldBorderColor(BuildContext context) {
    return getColor(context, AppColors.borderDark, AppColors.darkTextSubTitle);
  }

  static Color textGreyed(BuildContext context) {
    return getColor(context, AppColors.textGreyed, AppColors.darkTextSubTitle);
  }

  static Color textParagraph(BuildContext context) {
    return getColor(context, AppColors.textParaLight, AppColors.textParaDark);
  }

  static Color border(BuildContext context) {
    return getColor(context, AppColors.borderLight, AppColors.borderDark);
  }

  static Color borderDarkGrey(BuildContext context) {
    return getColor(
      context,
      AppColors.borderDarkGreyL,
      AppColors.borderDarkGreyD,
    );
  }

  static Color borderMediumGrey(BuildContext context) {
    return getColor(
      context,
      AppColors.lightBorderMediumGray,
      AppColors.darkBorderMediumGray,
    );
  }

  static Color buttonFill(BuildContext context) {
    return getColor(
      context,
      AppColors.buttonFillLight,
      AppColors.buttonFillDark,
    );
  }

  static Color iconsParagraph(BuildContext context) {
    return getColor(
      context,
      AppColors.lightIconsParagraph,
      AppColors.darkIconsParagraph,
    );
  }

  static Color iconsMenu(BuildContext context) {
    return getColor(context, AppColors.lightIconsMenu, AppColors.darkIconsMenu);
  }

  static Color icon(BuildContext context) {
    return getColor(context, AppColors.lightIcons, AppColors.darkIcons);
  }

  static Color formBorder(BuildContext context) {
    return getColor(context, AppColors.borderLight, AppColors.borderGreyDark);
  }

  static Color divider(BuildContext context) {
    return getColor(context, AppColors.dividerLight, AppColors.dividerDark);
  }

  static Color borderRegular(BuildContext context) {
    return getColor(
      context,
      AppColors.borderRegularLight,
      AppColors.borderRegularDark,
    );
  }
}
