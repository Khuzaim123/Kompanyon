import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const CustomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarIcon(Icons.home, 0),
          _buildNavBarIcon(Icons.search, 1),
          _buildNavBarIcon(Icons.add_circle, 2, isPrimary: true),
          _buildNavBarIcon(Icons.notifications_none, 3),
          _buildNavBarIcon(Icons.person_outline, 4),
        ],
      ),
    );
  }

  Widget _buildNavBarIcon(IconData icon, int index, {bool isPrimary = false}) {
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration:
            isPrimary
                ? BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                )
                : null,
        child: Icon(
          icon,
          size: isPrimary ? 32 : 26,
          color:
              isPrimary
                  ? Colors.white
                  : (selectedIndex == index
                      ? AppColors.primary
                      : AppColors.textTertiary),
        ),
      ),
    );
  }
}
