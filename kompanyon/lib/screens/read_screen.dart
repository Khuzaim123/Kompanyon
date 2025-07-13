import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/custom_card.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'package:provider/provider.dart';
import '../providers/nav_provider.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
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

  final List<Map<String, dynamic>> articles = [
    {
      'title': 'Why Feeling Your Feelings Is Actually a Superpower',
      'date': '25 Mar 2025',
      'views': 200,
    },
    {
      'title': 'Building Confidence: What Happens When You Believe in You',
      'date': '25 Mar 2025',
      'views': 200,
    },
    {'title': '', 'date': '25 Mar 2025', 'views': 200},
  ];

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
                          'Read',
                          style: AppTextStyles.h3.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Tap in. Learn something that hits different.',
                          style: AppTextStyles.bodyLarge,
                        ),
                        const SizedBox(height: 18),
                        ...articles
                            .map((article) => _buildArticleCard(article))
                            .toList(),
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

  Widget _buildArticleCard(Map<String, dynamic> article) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: CustomCard(
        borderRadius: 24,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if ((article['title'] as String).isNotEmpty)
              Text(
                article['title'],
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: AppColors.textTertiary,
                ),
                const SizedBox(width: 4),
                Text(
                  article['date'],
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.remove_red_eye,
                  size: 16,
                  color: AppColors.textTertiary,
                ),
                const SizedBox(width: 4),
                Text(
                  '${article['views']}',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
