import 'package:flutter/material.dart';
import 'package:notesmedia/utils/constants/colors.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  /// LIGHT THEME
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      /// Remove shadow
      elevation: 0,
      /// Text and icon color
      foregroundColor: TColors.textPrimary,
      /// Button border color
      side: BorderSide(color: TColors.primary),
      /// Text style inside button
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black, // color for readability, can also use TColors.textPrimary
        fontWeight: FontWeight.w600,
      ),
      /// Padding inside button
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      /// Rounded corners
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  /// DARK THEME
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      /// Remove shadow
      elevation: 0,
      /// Text and icon color
      foregroundColor: TColors.textPrimary,
      /// Button border color
      side: BorderSide(color: TColors.primary),
      /// Text style inside button
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white, // color for readability, can also use TColors.textPrimary
        fontWeight: FontWeight.w600,
      ),
      /// Padding inside button
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      /// Rounded corners
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
