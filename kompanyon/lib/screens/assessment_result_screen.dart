import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class AssessmentResultScreen extends StatelessWidget {
  final String username;
  final String resultType;
  const AssessmentResultScreen({
    Key? key,
    this.username = 'Juwon',
    this.resultType = 'beginner enthusiast',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.background, AppColors.backgroundSecondary],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeIn,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  const Text('🏅', style: TextStyle(fontSize: 48)),
                  const SizedBox(height: 18),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTextStyles.h3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(text: 'Hey $username, You\'re A\n'),
                        TextSpan(
                          text: resultType,
                          style: AppTextStyles.h3.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    "You’re open, curious, and ready to discover what helps you grow stronger, calmer, and more confident—one step at a time\n\nThis kind of self-awareness is the foundation of real, lasting change. You’re already on your way and Kompanyon is here to help you build skills that strengthen your mind, boost your confidence, and shape a future you believe in.\n\nYour journey starts with one choice—and you just made it. 💪",
                    style: AppTextStyles.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  CustomButton(
                    text: 'Agree and continue',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    backgroundColor: AppColors.primary,
                    width: double.infinity,
                    borderRadius: 24,
                    icon: const Icon(Icons.arrow_forward, size: 20),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    text: 'Reset answers',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/assessment-intro',
                      );
                    },
                    backgroundColor: Colors.white,
                    textColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    borderWidth: 1,
                    width: double.infinity,
                    borderRadius: 24,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
