import 'package:get/get.dart';
import 'package:notesmedia/features/ai/screens/ai_screen.dart';
import 'package:notesmedia/features/authentication/screens/login_screen.dart';
import 'package:notesmedia/features/authentication/screens/sign_up/sign_up_screen.dart';
import 'package:notesmedia/features/home/screen/home_screen.dart';
import 'package:notesmedia/features/notifications/screens/notification_screen.dart';
import 'package:notesmedia/features/onboarding/onboarding_screen.dart';
import 'package:notesmedia/features/search/screens/search_screen.dart';
import 'package:notesmedia/firebase/firebase_auth/auth_wrapper.dart';
import 'package:notesmedia/navigation_menu.dart';
import 'package:notesmedia/routes/routes.dart';

import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  final String title;
  const DummyScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(title, style: const TextStyle(fontSize: 24))),
    );
  }
}

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.signIn, page: () => LoginScreen()),
    GetPage(name: TRoutes.signUp, page: () => const SignupScreen()),
    GetPage(name: TRoutes.navigationMenu, page: () => const NavigationMenu()),
    GetPage(
      name: TRoutes.authWrapper,
      page: () => const AuthenticationWrapper(),
    ),
    GetPage(name: TRoutes.onboarding, page: () => const OnboardingScreen()),

    /// bottom navigation pages
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.library, page: () => const DummyScreen("Library")),
    GetPage(name: TRoutes.progress, page: () => const DummyScreen("Progress")),
    GetPage(name: TRoutes.blog, page: () => const DummyScreen("Blog")),
    GetPage(name: TRoutes.profile, page: () => const DummyScreen("Profile")),

    /// search page
    GetPage(name: TRoutes.search, page: () => const SearchScreen()),

    /// Ai page
    GetPage(name: TRoutes.ai, page: () => const AiScreen()),
    /// Notification Screen

    GetPage(name: TRoutes.notification, page: () => const NotificationScreen()),
  ];
}
