import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'package:provider/provider.dart';
import '../providers/assessment_provider.dart';

class AssessmentQuestionScreen extends StatefulWidget {
  const AssessmentQuestionScreen({Key? key}) : super(key: key);

  @override
  State<AssessmentQuestionScreen> createState() =>
      _AssessmentQuestionScreenState();
}

class _AssessmentQuestionScreenState extends State<AssessmentQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final assessmentProvider = Provider.of<AssessmentProvider>(context);
    final _questionIndex = assessmentProvider.questionIndex;
    final _selected = assessmentProvider.selected;
    final _totalQuestions = assessmentProvider.totalQuestions;
    final List<String> _options = [
      'Excited and open',
      'A little unsure, but willing',
      'Not really interested right now',
      'I’ve never thought about it',
    ];
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
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: AppColors.primary,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Openness to Growth',
                        style: AppTextStyles.bodyLarge,
                      ),
                      const Spacer(),
                      Text(
                        'Question ${_questionIndex + 1}/$_totalQuestions',
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: (_questionIndex + 1) / _totalQuestions,
                    backgroundColor: AppColors.backgroundSecondary,
                    color: AppColors.primary,
                    minHeight: 4,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'When it comes to learning new ways to grow or understand myself, I feel...',
                    style: AppTextStyles.bodyLarge,
                  ),
                  const SizedBox(height: 18),
                  ...List.generate(
                    _options.length,
                    (i) => _buildRadioOption(
                      context,
                      i,
                      assessmentProvider,
                      _options,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Back',
                          onPressed:
                              _questionIndex == 0
                                  ? null
                                  : () => assessmentProvider.prevQuestion(),
                          backgroundColor: Colors.white,
                          textColor: AppColors.textPrimary,
                          borderColor: AppColors.primary,
                          borderWidth: 1,
                          borderRadius: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomButton(
                          text: 'Next',
                          onPressed: () {
                            if (_questionIndex < _totalQuestions - 1) {
                              assessmentProvider.nextQuestion();
                            } else {
                              assessmentProvider.reset();
                              Navigator.pushReplacementNamed(
                                context,
                                '/assessment-thankyou',
                              );
                            }
                          },
                          backgroundColor: AppColors.primary,
                          borderRadius: 24,
                        ),
                      ),
                    ],
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

  Widget _buildRadioOption(
    BuildContext context,
    int i,
    AssessmentProvider provider,
    List<String> options,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => provider.selectOption(i),
        child: Row(
          children: [
            Radio<int>(
              value: i,
              groupValue: provider.selected,
              onChanged: (val) => provider.selectOption(val ?? 0),
              activeColor: AppColors.primary,
            ),
            Expanded(child: Text(options[i], style: AppTextStyles.bodyLarge)),
          ],
        ),
      ),
    );
  }
}
