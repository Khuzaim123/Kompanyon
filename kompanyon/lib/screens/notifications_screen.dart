import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/custom_card.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'package:provider/provider.dart';
import '../providers/nav_provider.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool hasNotification = false; // Toggle for demo

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          'Notifications',
                          style: AppTextStyles.h3.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 32),
                        if (!hasNotification)
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('🔔', style: TextStyle(fontSize: 36)),
                                  SizedBox(height: 12),
                                  Text(
                                    'No notifications yet',
                                    style: AppTextStyles.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          CustomCard(
                            borderRadius: 20,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  '🔔',
                                  style: TextStyle(fontSize: 28),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'You have a new notification',
                                        style: AppTextStyles.bodyMedium,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Carry out your daily reflection now',
                                        style: AppTextStyles.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.textTertiary,
                                  size: 20,
                                ),
                              ],
                            ),
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
                        Navigator.pushReplacementNamed(context, '/notifications');
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
}
