import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:notesmedia/features/onboarding/widgets/onboarding_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notesmedia/Model/onboarding_slide.dart';
import 'package:notesmedia/routes/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double _pageOffset = 0.0;

  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _pageOffset = _pageController.page ?? 0.0;
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });

    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _buttonScaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _buttonAnimationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  Future<void> _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    if (mounted) {
      Get.offAllNamed(TRoutes.signIn);
    }
  }

  void _onButtonPressed() {
    _buttonAnimationController.forward().then((_) {
      _buttonAnimationController.reverse();
      if (_currentPage < slides.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
        );
      } else {
        _finishOnboarding();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorTween colorTween = ColorTween(
      begin: slides[_pageOffset.floor() % slides.length].color,
      end: slides[_pageOffset.ceil() % slides.length].color,
    );
    final double t = _pageOffset - _pageOffset.floor();
    final Color backgroundColor = colorTween.transform(t)!;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: backgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: _finishOnboarding,
                  child: Text(
                    'Skip',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: slides.length,
                  itemBuilder: (context, index) {
                    double distortion = 1.0;
                    if (_pageController.position.haveDimensions) {
                      distortion = (_pageOffset - index).abs();
                      distortion = 1 - (distortion.clamp(0.0, 1.0) * 0.4);
                    }
                    return SlideItem(slide: slides[index], distortion: distortion);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PageIndicator(itemCount: slides.length, currentPage: _currentPage),
                    ScaleTransition(
                      scale: _buttonScaleAnimation,
                      child: GestureDetector(
                        onTap: _onButtonPressed,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            transitionBuilder: (child, animation) =>
                                ScaleTransition(scale: animation, child: child),
                            child: Icon(
                              _currentPage == slides.length - 1
                                  ? Icons.check_rounded
                                  : Icons.arrow_forward_ios_rounded,
                              key: ValueKey<int>(_currentPage),
                              color: backgroundColor,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}