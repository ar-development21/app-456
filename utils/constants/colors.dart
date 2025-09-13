import 'package:flutter/material.dart';

class   TColors {
  TColors._();

  /// Primary & Accent
  /// Primary accent color (text-sky-400)
  static Color primary = const Color(0xFF38BDF8);
  /// Secondary accent / button gradient start (from-sky-500)
  static Color secondary = const Color(0xFF0EA5E9);
  /// Accent color / button gradient end (to-indigo-600)
  static Color accent = const Color(0xFF4F46E5);



  /// Text
  /// Primary text (white)
  static Color textPrimary = Colors.white;
  /// Secondary / body text (gray-300)
  static Color textSecondary = const Color(0xFFD1D5DB);
  /// Subtle/helper text (slate-400)
  static Color textSubtle = const Color(0xFF94A3B8);

  /// Backgrounds
  /// Main background (bg-slate-900)
  static Color primaryBackground = const Color(0xFF0F172A);
  /// Card/container background (bg-slate-800)
  static Color cardBackground = const Color(0xFF1E293B);
  /// Transparent card background (bg-slate-800/60)
  static Color transparentCardBackground = const Color(0xFF1E293B).withOpacity(0.6);

  /// Buttons
  /// Primary button background (text-sky-400)
  static Color buttonPrimary = const Color(0xFF38BDF8);
  /// Secondary button / gradient end (to-indigo-600)
  static Color buttonSecondary = const Color(0xFF4F46E5);
  /// Disabled button color (border/hover slate)
  static Color buttonDisabled = const Color(0xFF334155);

  /// Borders & Interactive Elements
  /// Primary border color (border-slate-700)
  static Color borderPrimary = const Color(0xFF334155);
  /// Hover / interactive element background (hover:bg-slate-700)
  static Color hover = const Color(0xFF334155);

  /// Feedback

  /// Success text color (text-emerald-400)
  static Color success = const Color(0xFF34D399);
  /// Error text color (text-red-400)
  static Color error = const Color(0xFFF87171);
  static const Color light = Color(0xFFFFFFFF);
  static const Color greyLight = Color(0xFFB0B0B0);
  static const Color greyDark = Color(0xFF4A4A4A);
  static const Color errorDark = Color(0xFFFF6B6B);
  /// Warning text color (yellow)
  static Color warning = const Color(0xFFFBBF24);
  /// Info text color (blue accent)
  static Color info = const Color(0xFF38BDF8);

  /// Greys & White/Black
  /// Black color
  static Color black = const Color(0xFF000000);
  /// Dark grey for cards/containers
  static Color darkGrey = const Color(0xFF1E293B);
  /// Grey for borders or secondary elements
  static Color grey = const Color(0xFF334155);
  /// Soft grey for subtle elements
  static Color softGrey = const Color(0xFF4F4F4F);
  /// White color
  static Color white = const Color(0xFFFFFFFF);

  /// Gradients
  static const Color gradientDarkStart = Color(0xFF312E81);
  static const Color gradientDarkEnd = Color(0xFF1E1B4B);
  static const Color gradientLightStart = Color(0xFF6366F1);
  static const Color gradientLightEnd = Color(0xFF4F46E5);
  /// Linear gradient for buttons / cards
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0EA5E9), // from-sky-500
      Color(0xFF4F46E5), // to-indigo-600
    ],
  );
}
