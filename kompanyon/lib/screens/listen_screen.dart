import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'package:provider/provider.dart';
import '../providers/nav_provider.dart';

class ListenScreen extends StatefulWidget {
  const ListenScreen({Key? key}) : super(key: key);

  @override
  State<ListenScreen> createState() => _ListenScreenState();
}

class _ListenScreenState extends State<ListenScreen> {
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
            colors: [Color(0xFFF8F6F9), Color(0xFFE6F0FA)],
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
                        // Header
                        Row(
                          children: [
                            const Icon(
                              Icons.lightbulb_outline,
                              color: AppColors.textTertiary,
                              size: 22,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Listen',
                              style: AppTextStyles.h3.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Meditations that help you reconnect, reflect, and reset.',
                          style: AppTextStyles.bodyLarge,
                        ),
                        const SizedBox(height: 18),
                        // Meditations list
                        _buildMeditationItem(
                          icon: Icons.emoji_nature,
                          title: 'Humility',
                          subtitle: 'Grow Without Needing To Know It All.',
                          duration: '2:37',
                          isPlaying: true,
                          progress: 0.4,
                        ),
                        _buildMeditationItem(
                          icon: Icons.visibility,
                          title: 'Understanding',
                          subtitle: 'See Others. See Yourself.',
                          duration: '2:37',
                        ),
                        _buildMeditationItem(
                          icon: Icons.self_improvement,
                          title: 'Mindfulness',
                          subtitle: 'Be Here. For Real.',
                          duration: '2:37',
                        ),
                        _buildMeditationItem(
                          icon: Icons.favorite_border,
                          title: 'Acceptance',
                          subtitle: 'You Don’t Have To Fight What You Feel.',
                          duration: '2:37',
                        ),
                        _buildMeditationItem(
                          icon: Icons.spa,
                          title: 'Nurture',
                          subtitle: 'Soft Is Strong.',
                          duration: '2:37',
                        ),
                        _buildMeditationItem(
                          icon: Icons.group,
                          title: 'Inclusive',
                          subtitle: 'Everyone Belongs Here—Including You.',
                          duration: '2:37',
                        ),
                        _buildMeditationItem(
                          icon: Icons.lock_outline,
                          title: 'Trust',
                          subtitle: 'Safety Starts Inside.',
                          duration: '2:37',
                        ),
                        _buildMeditationItem(
                          icon: Icons.person,
                          title: 'You',
                          subtitle: '',
                          duration: '2:37',
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

  Widget _buildMeditationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String duration,
    bool isPlaying = false,
    double progress = 0.0,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primary, size: 22),
              const SizedBox(width: 8),
              Text(
                title,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Icon(Icons.play_arrow, color: AppColors.primary, size: 22),
            ],
          ),
          if (subtitle.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 2, bottom: 2),
              child: Row(
                children: [
                  Icon(
                    Icons.description_outlined,
                    color: AppColors.textTertiary,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      subtitle,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textTertiary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.access_time,
                    color: AppColors.textTertiary,
                    size: 16,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    duration,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          if (isPlaying)
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 8, top: 6),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.backgroundSecondary,
                color: AppColors.primary,
                minHeight: 4,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
        ],
      ),
    );
  }
}
