import 'package:flutter/material.dart' as materialColors;
import 'package:flutter/material.dart';

class MainColors {
  static Color? backgroundColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.backgroundColor;
  static Color? shadowColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.shadowColor;
  static Color? textColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.textColor;
  static Color? inputColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.inputColor;
  static Color? disableColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.disableColor;
  static Color? infoColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.infoColor;
  static Color? errorColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.errorColor;
  static Color? successColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.successColor;
  static Color? warningColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.warningColor;

  static const Color primaryColor = materialColors.Color(0xFF333232);
  static const Color secondColor = materialColors.Color(0xFF1C9102);
  static const Color whiteColor = materialColors.Colors.white;
  static const Color blackColor = materialColors.Color(0xFF333232);
  static const Color transparentColor = materialColors.Colors.transparent;

  static const primaryGradientColor = LinearGradient(
    colors: [primaryColor, secondColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const secondGradientColor = LinearGradient(
    begin: Alignment(1.00, -0.02),
    end: Alignment(-1, 0.02),
    colors: [Color(0xFFFF8125), Color(0xFFFF5449)],
  );
}

class LightColors {
  static const Color backgroundColor = materialColors.Color(0xFFFFFFFF);
  static const Color shadowColor = materialColors.Color(0xFFDADADA);
  static const Color textColor = materialColors.Color(0xFF444444);
  static const Color inputColor = materialColors.Color(0xFFF7F7F7);
  static const Color disableColor = materialColors.Color(0xFF9E9E9E);
  static const Color infoColor = materialColors.Color(0xFF008FFF);
  static const Color errorColor = materialColors.Color(0xFFFF5151);
  static const Color warningColor = materialColors.Color(0xFFF59709);
  static const Color successColor = materialColors.Color(0xFF02BD4D);

  // static const String fullLogo = LogosAssetsConstants.lightFullLogo;
  // static const String iconLogo = LogosAssetsConstants.lightIconLogo;
}

class DarkColors {
  static const Color backgroundColor = materialColors.Color(0xFF181A21);
  static const Color shadowColor = materialColors.Color(0xFF0A0A0A);
  static const Color textColor = materialColors.Color(0xFFFFFFFF);
  static const Color inputColor = materialColors.Color(0xFF1E222B);
  static const Color disableColor = materialColors.Color(0xFFA39E9E);
  static const Color infoColor = materialColors.Color(0xFF45ADFF);
  static const Color errorColor = materialColors.Color(0xFFFF7575);
  static const Color warningColor = materialColors.Color(0xFFF59709);
  static const Color successColor = materialColors.Color(0xFF02BD4D);
  //static const String fullLogo = LogosAssetsConstants.darkFullLogo;
  //static const String iconLogo = LogosAssetsConstants.darkIconLogo;
}

@immutable
class ColorsStyles extends ThemeExtension<ColorsStyles> {
  const ColorsStyles({
    required this.backgroundColor,
    required this.disableColor,
    required this.textColor,
    required this.infoColor,
    required this.errorColor,
    required this.warningColor,
    required this.successColor,
    required this.shadowColor,
    required this.inputColor,
    // required this.fullLogo,
    // required this.iconLogo,
  });

  final Color? backgroundColor;
  final Color? disableColor;
  final Color? textColor;
  final Color? infoColor;
  final Color? errorColor;
  final Color? warningColor;
  final Color? successColor;
  final Color? shadowColor;
  final Color? inputColor;
  // final String? fullLogo;
  //final String? iconLogo;

  @override
  ColorsStyles copyWith({
    Color? backgroundColor,
    Color? disableColor,
    Color? textColor,
    Color? infoColor,
    Color? warningColor,
    Color? errorColor,
    Color? successColor,
    Color? shadowColor,
    Color? inputColor,
    Color? unSelectedColor,
    Color? cardColor,
    String? logo,
  }) {
    return ColorsStyles(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disableColor: disableColor ?? this.disableColor,
      textColor: textColor ?? this.textColor,
      infoColor: infoColor ?? this.infoColor,
      warningColor: warningColor ?? this.warningColor,
      errorColor: errorColor ?? this.errorColor,
      successColor: successColor ?? this.successColor,
      inputColor: inputColor ?? this.inputColor,
      shadowColor: shadowColor ?? this.shadowColor,
      //fullLogo: fullLogo ?? fullLogo,
      // iconLogo: iconLogo ?? iconLogo,
    );
  }

  @override
  ColorsStyles lerp(ThemeExtension<ColorsStyles>? other, double t) {
    if (other is! ColorsStyles) {
      return this;
    }
    return ColorsStyles(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      disableColor: Color.lerp(disableColor, other.disableColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      infoColor: Color.lerp(infoColor, other.infoColor, t),
      warningColor: Color.lerp(warningColor, other.warningColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      successColor: Color.lerp(successColor, other.successColor, t),
      inputColor: Color.lerp(inputColor, other.inputColor, t),
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
      //fullLogo: fullLogo,
      //iconLogo: iconLogo,
    );
  }
}
