import 'package:flutter/material.dart';

class AppColors {
  // Primary green colors matching Figma design
  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color lightGreen = Color(0xFF4CAF50);
  static const Color darkGreen = Color(0xFF1B5E20);
  static const Color accentGreen = Color(0xFF66BB6A);
  static const Color accentCoral = Color(0xFFF7A598);
  // Gradient colors
  static const Color gradientStart = Color(0xFF66BB6A);
  static const Color gradientMiddle = Color(0xFF4CAF50);
  static const Color gradientEnd = Color(0xFF2E7D32);

  // Background colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFF8F9FA);
  static const Color surfaceColor = Color(0xFFFAFAFA);

  // Text colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textLight = Color(0xFF9E9E9E);

  // Accent colors
  static const Color orangeAccent = Color(0xFFFF7043);
  static const Color coralAccent = Color(0xFFFF8A80);

  // UI element colors
  static const Color divider = Color(0xFFE9ECEF);
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color shadowColor = Color(0x1A000000);

  // Button colors
  static const Color facebookColor = Color(0xFF1877F2);
  static const Color googleColor = Color(0xFFDB4437);
}

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
    fontFamily: 'Inter',
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
    fontFamily: 'Inter',
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
    fontFamily: 'Inter',
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
    fontFamily: 'Inter',
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
    fontFamily: 'Inter',
  );

  static const TextStyle bodyText3 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
    fontFamily: 'Inter',
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
    height: 1.3,
    fontFamily: 'Inter',
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.2,
    fontFamily: 'Inter',
  );

  static const TextStyle labelText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.2,
    fontFamily: 'Inter',
  );
}

// Gradient definitions
class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.gradientStart,
      AppColors.gradientMiddle,
      AppColors.gradientEnd,
    ],
  );

  static const LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.orangeAccent, AppColors.coralAccent],
  );
}

class AppConstants {
  static const double borderRadius = 12.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double iconSize = 24.0;
}
