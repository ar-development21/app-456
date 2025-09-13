import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/common/widgets_login_signup/form_divider.dart';
import 'package:notesmedia/common/widgets_login_signup/loaders/loaders.dart';
import 'package:notesmedia/common/widgets_login_signup/social_button.dart';
import 'package:notesmedia/features/authentication/controllers/auth_controller.dart';
import 'package:notesmedia/features/authentication/models/auth_response.dart';
import 'package:notesmedia/routes/routes.dart';
import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/utils/constants/image_strings.dart';
import 'package:notesmedia/utils/constants/sizes.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';
import 'package:notesmedia/utils/validators/validation.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  void _showSignUpForm() {
    Get.toNamed(TRoutes.signUp);
  }

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    final isDarkMode = THelperFunctions.isDarkMode(context);

    final textPrimary = isDarkMode ? TColors.greyLight : TColors.greyDark;
    final hintTextColor = isDarkMode ? TColors.greyLight : TColors.greyDark;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// App Logo
                Image.asset(
                  TImages.appLogo,
                  height: 100,

                ),
                const SizedBox(height: 60),

                Text(
                  "Sign In to Your Account",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textPrimary,
                  ),
                ),
                SizedBox(height: TSizes.defaultSpace),

                // Email
                TextFormField(
                  controller: emailController,
                  validator: (value) => TValidator.validateEmail(value),
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                    hintStyle: GoogleFonts.poppins(color: hintTextColor),
                    prefixIcon: Icon(Icons.email_outlined, color: hintTextColor),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),

                // Password
                TextFormField(
                  controller: passwordController,
                  validator: (value) => TValidator.validatePassword(value),
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    hintStyle: GoogleFonts.poppins(color: hintTextColor),
                    prefixIcon: Icon(Icons.lock_outline, color: hintTextColor),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: hintTextColor,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),

                /// Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: authController.isLoading
                        ? null
                        : () async {
                      if (_formKey.currentState!.validate()) {
                        final AuthResponse? res = await authController.login(
                          emailController.text,
                          passwordController.text,
                        );
                        if (res != null && res.status) {
                          TLoaders.successSnackBar(
                            title: 'Login Success',
                            message: res.message ?? 'Welcome back!',
                          );
                          Get.offAllNamed(TRoutes.navigationMenu);
                        } else {
                          TLoaders.errorSnackBar(
                            title: 'Login Failed',
                            message: res?.message ?? 'Invalid credentials',
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: authController.isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: TSizes.spaceBtwSections),

                /// Divider
                const TFormDivider(dividerText: 'Or sign in with'),
                SizedBox(height: TSizes.spaceBtwInputFields),

                /// Social Button
                const TSocialButton(),
                SizedBox(height: TSizes.spaceBtwSections),

                /// Sign Up link
                TextButton(
                  onPressed: _showSignUpForm,
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: GoogleFonts.poppins(
                        color: TColors.greyDark,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: GoogleFonts.poppins(
                            color: TColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
