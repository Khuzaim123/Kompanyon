import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'package:provider/provider.dart';
import '../providers/assessment_provider.dart';

class AssessmentIntroScreen extends StatelessWidget {
  const AssessmentIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assessmentProvider = Provider.of<AssessmentProvider>(
      context,
      listen: false,
    );
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'Check In. Level Up.',
                    style: AppTextStyles.h3.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 18),
                  _buildCheckmarkText(
                    'This isn’t a test. It’s a check-in—to help you understand where you are in your journey with growth, mindfulness, and mental wellness.',
                  ),
                  const SizedBox(height: 10),
                  _buildCheckmarkText(
                    'You’ll get a simple snapshot of how ready you are to build confidence, focus, and emotional strength.',
                  ),
                  const SizedBox(height: 10),
                  _buildCheckmarkText(
                    'There are no wrong answers—just honest ones.',
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Take a few deep breaths and answer with what feels true for you',
                    style: AppTextStyles.bodyLarge,
                  ),
                  const Spacer(),
                  CustomButton(
                    text: 'Lets begin',
                    onPressed: () {
                      assessmentProvider.reset();
                      Navigator.pushNamed(context, '/assessment-question');
                    },
                    backgroundColor: AppColors.primary,
                    width: double.infinity,
                    borderRadius: 24,
                    icon: const Icon(Icons.arrow_forward, size: 20),
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

  Widget _buildCheckmarkText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check, color: AppColors.success, size: 20),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: AppTextStyles.bodyLarge)),
      ],
    );
  }
}
