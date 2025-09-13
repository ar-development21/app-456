import 'package:flutter/material.dart';
import 'package:notesmedia/utils/constants/colors.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  /// LIGHT THEME
  static final lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    /// Background color of the bottom sheet
    backgroundColor: TColors.cardBackground,
    /// Modal overlay background
    modalBackgroundColor: TColors.primaryBackground,
    /// Full width
    constraints: const BoxConstraints(minWidth: double.infinity),
    /// Rounded corners
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  /// DARK THEME
  static final darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    /// Background color of the bottom sheet (card color)
    backgroundColor: TColors.cardBackground,
    /// Modal overlay background (main background)
    modalBackgroundColor: TColors.primaryBackground,
    /// Full width
    constraints: const BoxConstraints(minWidth: double.infinity),
    /// Rounded corners
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
