import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesmedia/bindings/general_bindings.dart';
import 'package:notesmedia/features/authentication/controllers/auth_controller.dart';
import 'package:notesmedia/features/home/providers/home_provider.dart';
import 'package:notesmedia/routes/app_routes.dart';
import 'package:notesmedia/routes/routes.dart';
import 'package:notesmedia/utils/theme/theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>.value(
          value: Get.put(AuthController()), // Reuse GetX instance
        ),
        ChangeNotifierProvider<PreferenceProvider>.value(
          value: Get.put(PreferenceProvider()), // Reuse GetX instance
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialBinding: GeneralBindings(),
        getPages: AppRoutes.pages,
        initialRoute: TRoutes.authWrapper,
      ),
    );
  }
}