import 'package:flutter/material.dart';
import 'package:notesmedia/utils/constants/colors.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  /// LIGHT THEME
  static final CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    /// Checkbox shape with rounded corners
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),

    /// Color of the check mark
    checkColor: MaterialStateProperty.resolveWith((states) {
      /// When checked, use white
      if (states.contains(MaterialState.selected)) {
        return TColors.textPrimary;
      }
      /// When unchecked, use dark text
      else {
        return TColors.textSecondary;
      }
    }),

    /// Fill color of the checkbox
    fillColor: MaterialStateProperty.resolveWith((states) {
      /// Selected: primary accent
      if (states.contains(MaterialState.selected)) {
        return TColors.primary;
      }
      /// Unselected: transparent
      else {
        return Colors.transparent;
      }
    }),
  );

  /// DARK THEME
  static final CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    /// Checkbox shape with rounded corners
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),

    /// Color of the check mark
    checkColor: MaterialStateProperty.resolveWith((states) {
      /// When checked, use white
      if (states.contains(MaterialState.selected)) {
        return TColors.textPrimary;
      }
      /// When unchecked, use subtle text
      else {
        return TColors.textSubtle;
      }
    }),

    /// Fill color of the checkbox
    fillColor: MaterialStateProperty.resolveWith((states) {
      /// Selected: primary accent
      if (states.contains(MaterialState.selected)) {
        return TColors.primary;
      }
      /// Unselected: transparent
      else {
        return Colors.transparent;
      }
    }),
  );
}
