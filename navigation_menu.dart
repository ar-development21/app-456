import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesmedia/features/home/screen/home_screen.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';
import 'package:notesmedia/utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      /// ✅ BottomNavigationBar instead of NavigationBar
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              activeIcon: Icon(Icons.library_books),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment_outlined),
              activeIcon: Icon(Icons.assessment),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              activeIcon: Icon(Icons.article),
              label: 'Blog',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor:
          Theme.of(context).bottomNavigationBarTheme.selectedItemColor ??
              ( TColors.primary ),
          unselectedItemColor:
          Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ??
              Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
              (isDark ? Colors.black : Colors.white),
          elevation: 10,
          onTap: (index) => controller.selectedIndex.value = index,
        ),
      ),

      /// Body changes according to selected index
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  /// Replace DummyScreen with your actual pages
  final screens = const [
    HomeScreen(),
    DummyScreen("Library"),
    DummyScreen("Progress"),
    DummyScreen("Blog"),
    DummyScreen("Profile"),
  ];
}

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
