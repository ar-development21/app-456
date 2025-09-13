import 'package:flutter/material.dart';
import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/utils/constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  /// LIGHT THEME
  static final InputDecorationTheme lightInputDecorationTheme =
  InputDecorationTheme(
    /// Maximum lines for error messages
    errorMaxLines: 3,

    /// Icon colors
    prefixIconColor: TColors.textSubtle,
    suffixIconColor: TColors.textSubtle,

    /// Label and hint styles
    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: TColors.textPrimary,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: TColors.textSecondary,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: TColors.textPrimary),

    /// Padding inside input
    contentPadding: EdgeInsets.symmetric(
      horizontal: TSizes.md,
      vertical: TSizes.iconXs,
    ),

    /// Borders
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: TColors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: TColors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: TColors.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: 1, color: TColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: 2, color: TColors.warning),
    ),
  );

  /// DARK THEME
  static final InputDecorationTheme darkInputDecorationTheme =
  InputDecorationTheme(
    /// Maximum lines for error messages
    errorMaxLines: 3,

    /// Icon colors
    prefixIconColor: TColors.textSubtle,
    suffixIconColor: TColors.textSubtle,

    /// Label and hint styles
    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: TColors.textPrimary,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: TColors.textSecondary,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: TColors.textPrimary),

    /// Padding inside input
    contentPadding: EdgeInsets.symmetric(
      horizontal: TSizes.md,
      vertical: TSizes.iconXs,
    ),

    /// Borders
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: TColors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: TColors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: TColors.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: 1, color: TColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: 2, color: TColors.warning),
    ),
  );
}
