import 'package:flutter/material.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class ThemeStyles {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: LightColors.backgroundColor,
    primaryColor: MainColors.primaryColor,
    scaffoldBackgroundColor: LightColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: MainColors.primaryColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: MainColors.primaryColor,
      selectionColor: MainColors.primaryColor,
      selectionHandleColor: MainColors.primaryColor,
    ),
    splashColor: MainColors.primaryColor,
    highlightColor: MainColors.primaryColor,
    buttonTheme: ButtonThemeData(
      splashColor: MainColors.primaryColor,
      highlightColor: MainColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: MainColors.primaryColor,
        primary: MainColors.primaryColor,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: MainColors.primaryColor),
    extensions: <ThemeExtension<dynamic>>[
      const ColorsStyles(
        backgroundColor: LightColors.backgroundColor,
        textColor: LightColors.textColor,
        disableColor: LightColors.disableColor,
        errorColor: LightColors.errorColor,
        infoColor: LightColors.infoColor,
        inputColor: LightColors.inputColor,
        successColor: LightColors.successColor,
        warningColor: LightColors.warningColor,
        shadowColor: LightColors.shadowColor,
        //fullLogo: LightColors.fullLogo,
        //iconLogo: LightColors.iconLogo,
      ),
    ],
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: DarkColors.backgroundColor,
    primaryColor: MainColors.primaryColor,
    scaffoldBackgroundColor: DarkColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: MainColors.primaryColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: MainColors.primaryColor,
      selectionColor: MainColors.primaryColor,
      selectionHandleColor: MainColors.primaryColor,
    ),
    splashColor: MainColors.primaryColor,
    highlightColor: MainColors.primaryColor,
    buttonTheme: ButtonThemeData(
      splashColor: MainColors.primaryColor,
      highlightColor: MainColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: MainColors.primaryColor,
        primary: MainColors.primaryColor,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: MainColors.primaryColor),
    extensions: <ThemeExtension<dynamic>>[
      const ColorsStyles(
        backgroundColor: DarkColors.backgroundColor,
        textColor: DarkColors.textColor,
        disableColor: DarkColors.disableColor,
        errorColor: DarkColors.errorColor,
        infoColor: DarkColors.infoColor,
        inputColor: DarkColors.inputColor,
        successColor: DarkColors.successColor,
        warningColor: DarkColors.warningColor,
        shadowColor: DarkColors.shadowColor,
        //fullLogo: DarkColors.fullLogo,
        //iconLogo: DarkColors.iconLogo,
      ),
    ],
  );
}
