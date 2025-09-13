import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/Model/onboarding_slide.dart';

// Single Slide UI
class SlideItem extends StatelessWidget {
  final OnboardingSlide slide;
  final double distortion;

  const SlideItem({
    super.key,
    required this.slide,
    required this.distortion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: distortion,
            child: Icon(
              slide.icon,
              size: 150,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 60),
          Transform.translate(
            offset: Offset(0, 50 * (1 - distortion)),
            child: Opacity(
              opacity: distortion,
              child: Text(
                slide.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Transform.translate(
            offset: Offset(0, 70 * (1 - distortion)),
            child: Opacity(
              opacity: distortion,
              child: Text(
                slide.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.8),
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Indicator Dots
class PageIndicator extends StatelessWidget {
  final int itemCount;
  final int currentPage;

  const PageIndicator({
    super.key,
    required this.itemCount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        itemCount,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: currentPage == index ? 24 : 8,
          decoration: BoxDecoration(
            color: currentPage == index
                ? Colors.white
                : Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
