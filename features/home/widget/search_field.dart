import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/routes/routes.dart';


class TSearchField extends StatelessWidget {
  const TSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>Get.toNamed(TRoutes.search), // Navigate to search page
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.white70, size: 22),
            const SizedBox(width: 12),
            Text(
              "Search courses, notes...",
              style: GoogleFonts.poppins(color: Colors.white70, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
