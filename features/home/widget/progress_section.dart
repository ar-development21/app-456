import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/features/home/widget/progress_stat.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';
import 'package:notesmedia/utils/constants/colors.dart'; // Import TColors

class TProgressSection extends StatelessWidget {
  const TProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Progress",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            color: isDarkMode ? TColors.black : TColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isDarkMode ? TColors.greyDark : TColors.greyLight,
            ),
            boxShadow: [
              BoxShadow(
                color: TColors.grey.withOpacity(isDarkMode ? 0.4 : 0.4),
                blurRadius: 6,
                spreadRadius: 1,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          value: 0.65,
                          strokeWidth: 8,
                          backgroundColor:
                          isDarkMode ? TColors.greyDark : TColors.greyLight,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                        Center(
                          child: Text(
                            "65%",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Daily Study Goal",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? TColors.greyLight : TColors.greyDark,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "You're on track! Keep it up.",
                          style: GoogleFonts.poppins(
                            color: isDarkMode ? TColors.greyLight : TColors.greyDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  TProgressStat(
                    value: "12",
                    label: "Notes Read",
                    color: Colors.green,
                  ),
                  TProgressStat(
                    value: "8",
                    label: "Tests Taken",
                    color: Colors.blue,
                  ),
                  TProgressStat(
                    value: "75%",
                    label: "Completion",
                    color: Colors.orange,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
