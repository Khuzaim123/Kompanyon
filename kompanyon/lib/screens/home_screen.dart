import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_nav_bar.dart';
import 'package:provider/provider.dart';
import '../providers/nav_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome message
                  RichText(
                    text: TextSpan(
                      style: AppTextStyles.h4.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      children: const [
                        TextSpan(text: 'Welcome, '),
                        TextSpan(
                          text: 'Juwon ',
                          style: TextStyle(color: AppColors.primary),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.only(left: 2),
                            child: Text('👋', style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Glad you're in. Let's dive in.",
                    style: AppTextStyles.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  // Grid cards
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 18,
                      childAspectRatio: 1,
                      children: [
                        _buildGridCard(
                          title: 'Listen',
                          subtitle:
                              'Reconnect Reflect\nReset (Put Them One Under Each Other)',
                          route: '/listen',
                        ),
                        _buildGridCard(
                          title: 'Learn',
                          subtitle:
                              'fuel for your thoughts. tools for your journey.',
                          route: '/learn',
                        ),
                        _buildGridCard(
                          title: 'Your pathway',
                          subtitle: 'Choose Your Way. Own Your Story.',
                        ),
                        _buildGridCard(
                          title: 'Read',
                          subtitle: 'quick read. big insights.',
                          route: '/read',
                        ),
                        _buildGridCard(
                          title: 'Assessment',
                          subtitle: 'Check In. Not Check Out.',
                        ),
                        _buildGridCard(
                          title: 'From Your Coach',
                          subtitle: 'your journey. their guidance.',
                        ),
                      ],
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
      ),
    );
  }

  Widget _buildGridCard({
    required String title,
    required String subtitle,
    String? route,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route ?? '/');
      },
      child: CustomCard(
        borderRadius: 20,
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
