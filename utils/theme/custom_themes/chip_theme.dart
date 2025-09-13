import 'package:flutter/material.dart';
import 'package:notesmedia/utils/constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  /// LIGHT THEME
  static final ChipThemeData lightChipTheme = ChipThemeData(
    /// Disabled chip background color
    disabledColor: TColors.grey.withOpacity(0.4),
    /// Text style for chip label
    labelStyle: TextStyle(color: TColors.textPrimary),
    /// Color when chip is selected
    selectedColor: TColors.primary,
    /// Padding inside chip
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    /// Checkmark color when selected
    checkmarkColor: TColors.textPrimary,
  );

  /// DARK THEME
  static final ChipThemeData darkChipTheme = ChipThemeData(
    /// Disabled chip background color
    disabledColor: TColors.grey.withOpacity(0.4),
    /// Text style for chip label
    labelStyle: TextStyle(color: TColors.textPrimary),
    /// Color when chip is selected
    selectedColor: TColors.primary,
    /// Padding inside chip
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    /// Checkmark color when selected
    checkmarkColor: TColors.textPrimary,
  );
}
