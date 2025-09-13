import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';

class TFeaturedContentTitle extends StatelessWidget {
  final String title;
  const TFeaturedContentTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: isDarkMode ? TColors.textPrimary : TColors.black,
      ),
    );
  }
}
