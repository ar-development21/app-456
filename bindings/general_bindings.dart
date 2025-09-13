import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:notesmedia/common/widgets_login_signup/network_manager/network_manager.dart';
import 'package:notesmedia/features/authentication/controllers/auth_controller.dart';
import 'package:notesmedia/features/home/providers/home_provider.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // Inject NetworkManager
    Get.put(NetworkManager(), permanent: true); // Persistent
    Get.put(AuthController(), permanent: true); // Persistent
    Get.put(PreferenceProvider(), permanent: true); // Persistent
    // Initialize FCM
    FCMService.initialize();
  }
}

class FCMService {
  static Future<void> initialize() async {
    // Request permissions (iOS)
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    print("FCM permission: ${settings.authorizationStatus}");

    // Get the device token
    FirebaseMessaging.instance.getToken().then((token) {
      print("FCM Token: $token");
    });

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((message) {
      print("Foreground message: ${message.notification?.title}");
      // TODO: Show a local notification or dialog
    });

    // Handle notification when app is opened from background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("Opened from notification: ${message.notification?.title}");
      // TODO: Navigate or handle accordingly
    });
  }
}
