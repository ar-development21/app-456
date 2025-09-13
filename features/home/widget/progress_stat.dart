import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';
import 'package:notesmedia/utils/constants/colors.dart'; // TColors

class TProgressStat extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const TProgressStat({
    super.key,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: isDarkMode ? TColors.greyLight : TColors.greyDark,
          ),
        ),
      ],
    );
  }
}
