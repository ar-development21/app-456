import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/features/home/widget/search_field.dart';
import 'package:notesmedia/routes/routes.dart';
import 'package:notesmedia/utils/constants/image_strings.dart';
import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';

class THomeHeader extends StatelessWidget {
  const THomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDarkMode
              ? [TColors.gradientDarkStart, TColors.gradientDarkEnd]
              : [TColors.gradientLightStart, TColors.gradientLightEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    TImages.lightAppLogo,
                    width: 30,
                    height: 30,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "NotesMedia",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(TRoutes.ai),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white70),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.auto_awesome,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "AI",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () => Get.toNamed(TRoutes.notification),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            "Hello, Student 👋",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "What would you like to learn today?",
            style: GoogleFonts.poppins(
              color: Colors.white.withOpacity(0.9),
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 20),
          const TSearchField(),
        ],
      ),
    );
  }
}
