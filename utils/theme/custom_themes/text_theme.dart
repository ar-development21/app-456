import 'package:flutter/material.dart';
import 'package:notesmedia/utils/constants/colors.dart';

class TTextTheme {
  TTextTheme._();

  /// LIGHT TEXT THEME
  static final TextTheme lightTextTheme = TextTheme(
    /// Large headings
    headlineLarge: TextStyle(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.textPrimary),
    headlineMedium: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.textPrimary),
    headlineSmall: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.textPrimary),

    /// Titles
    titleLarge: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.textPrimary),
    titleMedium: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.textPrimary),
    titleSmall: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.textSecondary),

    /// Body text
    bodyLarge: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.textPrimary),
    bodyMedium: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: TColors.textSecondary),
    bodySmall: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.textSubtle),

    /// Labels
    labelLarge: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.textPrimary),
    labelMedium: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.textSubtle),
  );

  /// DARK TEXT THEME
  static final TextTheme darkTextTheme = TextTheme(
    /// Large headings
    headlineLarge: TextStyle(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.textPrimary),
    headlineMedium: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.textPrimary),
    headlineSmall: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.textPrimary),

    /// Titles
    titleLarge: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.textPrimary),
    titleMedium: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.textPrimary),
    titleSmall: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.textSecondary),

    /// Body text
    bodyLarge: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.textPrimary),
    bodyMedium: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: TColors.textSecondary),
    bodySmall: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.textSubtle),

    /// Labels
    labelLarge: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.textPrimary),
    labelMedium: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.textSubtle),
  );

  /// ThemeData wrappers for convenience
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
  );
}
