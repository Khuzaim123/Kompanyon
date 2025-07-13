import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.border, width: 0.5),
          color: AppColors.background,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top padding section
              const SizedBox(height: 378),

              // White background section
              Container(
                width: double.infinity,
                height: 116,
                color: AppColors.background,
              ),

              // Content section with negative margin effect
              Transform.translate(
                offset: const Offset(0, -43),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 307),
                  padding: const EdgeInsets.symmetric(horizontal: 26.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Main title with mixed colors
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: AppTextStyles.h1,
                          children: [
                            const TextSpan(
                              text: 'Welcome to ',
                              style: TextStyle(color: AppColors.textPrimary),
                            ),
                            const TextSpan(
                              text: 'Kompanyon',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),

                      // Spacing between title and subtitle
                      const SizedBox(height: 20),

                      // Subtitle
                      const Text(
                        'The space to feel, grow, and level up.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyLarge,
                      ),

                      // Spacing before buttons
                      const SizedBox(height: 40),

                      // Action buttons
                      CustomButton(
                        text: 'Get Started',
                        onPressed: () {
                          // Navigate to next screen
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        backgroundColor: AppColors.primary,
                      ),

                      const SizedBox(height: 16),

                      CustomButton(
                        text: 'Sign Up',
                        onPressed: () {
                          // Navigate to sign in screen
                          Navigator.pushNamed(context, '/signup');
                        },
                        backgroundColor: Colors.transparent,
                        textColor: AppColors.primary,
                        borderColor: AppColors.primary,
                        borderWidth: 1,
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom padding
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
