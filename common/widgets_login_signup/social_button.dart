import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/common/widgets_login_signup/loaders/loaders.dart';
import 'package:notesmedia/features/authentication/controllers/auth_controller.dart';
import 'package:notesmedia/routes/routes.dart';
import 'package:notesmedia/utils/constants/image_strings.dart';
import 'package:notesmedia/utils/constants/sizes.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({super.key, this.onGooglePressed});

  final VoidCallback? onGooglePressed;

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    final dark = THelperFunctions.isDarkMode(context);
    return Semantics(
      label: 'Google Sign-In Button',
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: authController.isLoading
              ? null
              : onGooglePressed ??
                    () async {
                      final res = await authController.googleSignIn();
                      if (res != null && res.status) {
                        TLoaders.successSnackBar(
                          title: 'Google Sign-In Success',
                          message: res.message ?? 'Welcome back!',
                        );
                        Get.offAllNamed(TRoutes.navigationMenu);
                      } else {
                        TLoaders.errorSnackBar(
                          title: 'Google Sign-In Failed',
                          message:
                              res?.message ?? 'Could not sign in with Google',
                        );
                      }
                    },
          icon: authController.isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Image.asset(
                  TImages.google,
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error, color: Colors.red),
                ),
          label: authController.isLoading
              ? const SizedBox.shrink()
              : Text(
                  "Sign in with Google",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: dark ? Colors.white : Colors.grey[700],
                  ),
                ),
        ),
      ),
    );
  }
}
