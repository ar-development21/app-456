import 'package:flutter/material.dart';
import 'package:notesmedia/utils/constants/colors.dart';

class TElevateButtonTheme {
  TElevateButtonTheme._();

  /// LIGHT THEME
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      /// Remove button shadow
      elevation: 0,
      /// Text/icon color
      foregroundColor: TColors.textPrimary,
      /// Background color
      backgroundColor: TColors.primary,
      /// Disabled text color
      disabledForegroundColor: TColors.textSubtle,
      /// Disabled background color
      disabledBackgroundColor: TColors.grey,
      /// Button border
      side: BorderSide(color: TColors.primary),
      /// Button padding
      padding: const EdgeInsets.symmetric(vertical: 18),
      /// Text style inside button
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white, // still use white for contrast on primary
        fontWeight: FontWeight.w600,
      ),
      /// Rounded corners
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  /// DARK THEME
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      /// Remove button shadow
      elevation: 0,
      /// Text/icon color
      foregroundColor: TColors.textPrimary,
      /// Background color
      backgroundColor: TColors.primary,
      /// Disabled text color
      disabledForegroundColor: TColors.textSubtle,
      /// Disabled background color
      disabledBackgroundColor: TColors.grey,
      /// Button border
      side: BorderSide(color: TColors.primary),
      /// Button padding
      padding: const EdgeInsets.symmetric(vertical: 18),
      /// Text style inside button
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white, // still use white for contrast on primary
        fontWeight: FontWeight.w600,
      ),
      /// Rounded corners
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
