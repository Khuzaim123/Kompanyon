import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Heading styles
  static const TextStyle h1 = TextStyle(
    fontSize: 44,
    height: 48 / 44,
    letterSpacing: -2,
    fontFamily: 'Gelica',
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 32,
    height: 40 / 32,
    letterSpacing: -1,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    height: 32 / 24,
    letterSpacing: -0.5,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 20,
    height: 28 / 20,
    letterSpacing: -0.25,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body text styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    height: 1.3,
    letterSpacing: -0.4,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    height: 1.5,
    letterSpacing: -0.2,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    height: 1.4,
    letterSpacing: -0.1,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // Button text styles
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Satoshi',
    color: Colors.white,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'Satoshi',
    color: Colors.white,
  );

  // Caption styles
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    height: 1.3,
    letterSpacing: 0.1,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.w400,
    color: AppColors.textTertiary,
  );

  // Label styles
  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Satoshi',
    color: AppColors.textPrimary,
  );
}
