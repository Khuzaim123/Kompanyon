import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'package:provider/provider.dart';
import '../providers/nav_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

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
                          'Search',
                          style: AppTextStyles.h3.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  decoration: const InputDecoration(
                                    hintText: 'Search audio',
                                    hintStyle: AppTextStyles.bodyMedium,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.search,
                                  color: AppColors.textTertiary,
                                ),
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
}
