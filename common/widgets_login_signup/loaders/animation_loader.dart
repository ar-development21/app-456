import 'package:notesmedia/utils/constants/colors.dart';
import 'package:notesmedia/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.onActionPressed,
    this.actionText,
  });

  /// Main text to display below the animation
  final String text;

  /// Optional action button text
  final String? actionText;

  /// Path to the Lottie animation asset
  final String animation;

  /// Whether to show the action button
  final bool showAction;

  /// Callback when action button is pressed
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        /// Make content scrollable to prevent overflow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Lottie animation
            Lottie.asset(
              animation,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.contain,
            ),

            /// Spacing between animation and text
            SizedBox(height: TSizes.defaultSpace),

            /// Main loader text
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),

            /// Spacing before action button
            SizedBox(height: TSizes.defaultSpace),

            /// Optional action button
            showAction
                ? SizedBox(
              width: 250,
              child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(
                  backgroundColor: TColors.cardBackground, // Dark card background
                  side: BorderSide(color: TColors.primary), // Border accent
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  actionText!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: TColors.textPrimary), // Text color
                ),
              ),
            )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
