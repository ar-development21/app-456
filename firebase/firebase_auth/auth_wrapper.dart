import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notesmedia/routes/routes.dart';

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({super.key});

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  void initState() {
    super.initState();
    _decideNavigation();
  }

  Future<void> _decideNavigation() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(const Duration(milliseconds: 500)); // optional small delay for splash feel

    if (!hasSeenOnboarding) {
      Get.offAllNamed(TRoutes.onboarding);   // 👈 Onboarding
    } else if (!isLoggedIn) {
      Get.offAllNamed(TRoutes.signIn);        // 👈 Login
    } else {
      Get.offAllNamed(TRoutes.navigationMenu); // 👈 Main app
    }
  }

  @override
  Widget build(BuildContext context) {
    // While deciding, just show loader
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
