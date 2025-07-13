import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_button.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'package:provider/provider.dart';
import '../providers/nav_provider.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({Key? key}) : super(key: key);

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int _selectedIndex = 0;

  void _onNavBarTap(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/search');
        break;
      case 2:
        // Add/Create
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/notifications');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavProvider>(context);
    final _selectedIndex = navProvider.selectedIndex;
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
          child: AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeIn,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: ListView(
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          'Learn',
                          style: AppTextStyles.h3.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Train your brain. Own your story.',
                          style: AppTextStyles.bodyLarge,
                        ),
                        const SizedBox(height: 18),
                        _buildChallengeCard(
                          icon: '🌟',
                          title: 'Challenge 1: Flip The Script',
                          subtitle:
                              'Build Self-Awareness And Shift Inner Dialogue.',
                          instructions: [
                            'For One Day, Pay Attention To The Negative Things You Say Or Think About Yourself (Like “I Can’t Do This” Or “I’m Not Good Enough”).',
                            'Write Down 3 Of Them—And Then Flip Them Into Something More Helpful Or Empowering.',
                            'Example:',
                            '“I’m Terrible At This” → “I’m Still Learning. And That’s Okay.”',
                          ],
                          reflectionPrompt:
                              'How Did It Feel To Challenge Your Inner Critic? Did Anything Shift In Your Mindset?',
                          closeText: 'Close Challenge',
                          duration: '2:37',
                          completed: true,
                        ),
                        const SizedBox(height: 18),
                        _buildChallengeCard(
                          icon: '🧊',
                          title: 'Challenge 2: Pause & Label',
                          subtitle:
                              'Improve emotional awareness and regulation.',
                          instructions: [
                            'Set A Timer 2—3 Times A Day. When It Goes Off, Pause What You’re Doing And Name The Emotion You’re Feeling In That Moment. Don’t Judge It—Just Label It.',
                          ],
                          reflectionPrompt: '—',
                          closeText: null,
                          duration: '2:37',
                          completed: false,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomNavBar(
                  selectedIndex: _selectedIndex,
                  onItemSelected: (index) {
                    navProvider.setIndex(index);
                    switch (index) {
                      case 0:
                        Navigator.pushReplacementNamed(context, '/home');
                        break;
                      case 1:
                        Navigator.pushReplacementNamed(context, '/search');
                        break;
                      case 2:
                        // Add/Create
                        break;
                      case 3:
                        Navigator.pushReplacementNamed(
                          context,
                          '/notifications',
                        );
                        break;
                      case 4:
                        Navigator.pushReplacementNamed(context, '/profile');
                        break;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChallengeCard({
    required String icon,
    required String title,
    required String subtitle,
    required List<String> instructions,
    required String reflectionPrompt,
    String? closeText,
    required String duration,
    required bool completed,
  }) {
    final card = CustomCard(
      borderRadius: 28,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Instructions:',
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          ...instructions.map(
            (i) => Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              child: Text(i, style: AppTextStyles.bodySmall),
            ),
          ),
          if (reflectionPrompt.isNotEmpty && reflectionPrompt != '-') ...[
            const SizedBox(height: 10),
            Text(
              'Reflection Prompt:',
              style: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(reflectionPrompt, style: AppTextStyles.bodySmall),
          ],
          if (closeText != null) ...[
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {},
              child: Text(
                closeText,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 16,
                color: AppColors.textTertiary,
              ),
              const SizedBox(width: 4),
              Text(
                duration,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textTertiary,
                ),
              ),
              const Spacer(),
              if (completed)
                CustomButton(
                  text: 'Completed',
                  onPressed: () {},
                  backgroundColor: AppColors.primary,
                  width: 120,
                  height: 36,
                  borderRadius: 18,
                  icon: const Icon(Icons.check, size: 18),
                ),
            ],
          ),
        ],
      ),
    );
    if (!completed) {
      return InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: () => Navigator.pushNamed(context, '/assessment-intro'),
        child: card,
      );
    }
    return card;
  }
}
