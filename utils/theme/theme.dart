import 'package:flutter/material.dart';
import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/utils/theme/custom_themes/appbar_theme.dart';
import 'package:notesmedia/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:notesmedia/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:notesmedia/utils/theme/custom_themes/chip_theme.dart';
import 'package:notesmedia/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:notesmedia/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:notesmedia/utils/theme/custom_themes/text_field_theme.dart';
import 'package:notesmedia/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    /// Primary color
    primaryColor: TColors.primary,
    /// Scaffold background
    scaffoldBackgroundColor: TColors.primaryBackground,
    /// Text theme
    textTheme: TTextTheme.lightTextTheme,
    /// AppBar theme
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    /// Chip theme
    chipTheme: TChipTheme.lightChipTheme,
    /// Checkbox theme
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    /// Bottom sheet theme
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    /// Elevated button theme
    elevatedButtonTheme: TElevateButtonTheme.lightElevatedButtonTheme,
    /// Outlined button theme
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    /// Input decoration / TextField theme
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    /// Primary color
    primaryColor: TColors.primary,
    /// Scaffold background
    scaffoldBackgroundColor: TColors.primaryBackground,
    /// Text theme
    textTheme: TTextTheme.darkTextTheme,
    /// AppBar theme
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    /// Chip theme
    chipTheme: TChipTheme.darkChipTheme,
    /// Checkbox theme
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    /// Bottom sheet theme
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    /// Elevated button theme
    elevatedButtonTheme: TElevateButtonTheme.darkElevatedButtonTheme,
    /// Outlined button theme
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    /// Input decoration / TextField theme
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
