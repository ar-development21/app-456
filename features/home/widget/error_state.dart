import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/features/home/providers/home_provider.dart';
import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';

class TErrorState extends StatelessWidget {
  final PreferenceProvider preferenceProvider;
  final String selectedPreference;

  const TErrorState({
    super.key,
    required this.preferenceProvider,
    required this.selectedPreference,
  });

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
              Icons.cloud_off_rounded,
              size: 60,
              color: isDarkMode ? TColors.textSubtle : TColors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              preferenceProvider.isUnsupportedPreference
                  ? "Content Coming Soon!"
                  : "Something Went Wrong",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? TColors.textPrimary : TColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              preferenceProvider.isUnsupportedPreference
                  ? "We're working hard to bring content for $selectedPreference."
                  : "We couldn't load the content. Please check your connection.",
              style: GoogleFonts.poppins(
                color: isDarkMode ? TColors.textSecondary : TColors.textSubtle,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            if (!preferenceProvider.isUnsupportedPreference)
              ElevatedButton.icon(
                onPressed: () {
                  preferenceProvider.fetchCourses(selectedPreference);
                },
                icon: const Icon(Icons.refresh_rounded),
                label: const Text("Try Again"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: TColors.white,
                  backgroundColor: TColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
