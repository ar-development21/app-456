import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';

class TEmptyState extends StatelessWidget {
  const TEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 60,
              color: isDarkMode ? TColors.textSubtle : TColors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              "No Courses Found",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? TColors.textPrimary : TColors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "There's no featured content available right now. Please check back later!",
              style: GoogleFonts.poppins(
                color: isDarkMode ? TColors.textSecondary : TColors.textSubtle,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
