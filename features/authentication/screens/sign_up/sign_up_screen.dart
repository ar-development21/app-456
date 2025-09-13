import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesmedia/common/widgets_login_signup/form_divider.dart';
import 'package:notesmedia/common/widgets_login_signup/loaders/loaders.dart';
import 'package:notesmedia/common/widgets_login_signup/social_button.dart';
import 'package:notesmedia/features/authentication/controllers/auth_controller.dart';
import 'package:notesmedia/routes/routes.dart';
import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/utils/constants/sizes.dart';
import 'package:notesmedia/utils/helpers/helper_functions.dart';
import 'package:notesmedia/utils/validators/validation.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _regFullNameController = TextEditingController();
  final _regEmailController = TextEditingController();
  final _regPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      final authController = Provider.of<AuthController>(context, listen: false);
      final res = await authController.register(
        _regEmailController.text,
        _regPasswordController.text,
        _regFullNameController.text,
      );
      setState(() => _isLoading = false);

      if (res != null && res.status) {
        TLoaders.successSnackBar(
          title: 'Registration Success',
          message: res.message ?? 'Account created successfully!',
        );
        Get.offAllNamed(TRoutes.navigationMenu);
      } else {
        TLoaders.errorSnackBar(
          title: 'Registration Failed',
          message: res?.message ?? 'Could not create account',
        );
      }
    }
  }

  void _showLoginForm() {
    Get.toNamed(TRoutes.signIn);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    final textColor = isDarkMode ? TColors.greyLight : TColors.greyDark;
    final hintColor = isDarkMode ? TColors.greyLight : TColors.grey;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Create your Account",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                SizedBox(height: TSizes.defaultSpace),

                /// FullName
                TextFormField(
                  controller: _regFullNameController,
                  validator: (value) => TValidator.validateEmptyText("FullName", value),
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    hintStyle: GoogleFonts.poppins(color: hintColor),
                  ),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: TSizes.spaceBtwItems),

                /// Email
                TextFormField(
                  controller: _regEmailController,
                  validator: (value) => TValidator.validateEmail(value),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: GoogleFonts.poppins(color: hintColor),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: TSizes.spaceBtwItems),

                /// Password
                TextFormField(
                  controller: _regPasswordController,
                  validator: (value) => TValidator.validatePassword(value),
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: GoogleFonts.poppins(color: hintColor),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: hintColor,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwItems),

                /// Confirm Password
                TextFormField(
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Confirm password is required";
                    if (value != _regPasswordController.text) return "Passwords do not match";
                    return null;
                  },
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: GoogleFonts.poppins(color: hintColor),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        color: hintColor,
                      ),
                      onPressed: _toggleConfirmPasswordVisibility,
                    ),
                  ),
                ),
                SizedBox(height: TSizes.defaultSpace),

                /// Signup button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: TSizes.defaultSpace),

                /// Divider
                const TFormDivider(dividerText: 'Or sign in with'),
                SizedBox(height: TSizes.spaceBtwItems),

                /// Social Button
                const TSocialButton(),
                SizedBox(height: TSizes.defaultSpace),

                /// Already have account
                TextButton(
                  onPressed: _showLoginForm,
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign in",
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
