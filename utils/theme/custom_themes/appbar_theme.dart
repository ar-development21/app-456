import 'package:flutter/material.dart';
import 'package:notesmedia/utils/constants/colors.dart';

class TAppBarTheme {
  TAppBarTheme._();

  /// LIGHT APPBAR THEME
  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    /// Action icons (menu, search, etc.)
    actionsIconTheme: IconThemeData(color: TColors.textPrimary, size: 24),
    /// Leading icons (back button)
    iconTheme: IconThemeData(color: TColors.textPrimary, size: 24),
    /// Title text style
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: TColors.textPrimary,
    ),
  );

  /// DARK APPBAR THEME
  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    /// Action icons (menu, search, etc.)
    actionsIconTheme: IconThemeData(color: TColors.textPrimary, size: 24),
    /// Leading icons (back button)
    iconTheme: IconThemeData(color: TColors.textPrimary, size: 24),
    /// Title text style
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: TColors.textPrimary,
    ),
  );
}
