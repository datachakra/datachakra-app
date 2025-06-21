import 'package:flutter/material.dart';

class AppColors {
  // Chakra Colors
  static const Color rootChakra = Color(0xFFE74C3C);
  static const Color sacralChakra = Color(0xFFF39C12);
  static const Color solarPlexusChakra = Color(0xFFF1C40F);
  static const Color heartChakra = Color(0xFF27AE60);
  static const Color throatChakra = Color(0xFF3498DB);
  static const Color thirdEyeChakra = Color(0xFF9B59B6);
  static const Color crownChakra = Color(0xFF8B4513);

  // Brand Colors
  static const Color primaryStart = Color(0xFF667EEA);
  static const Color primaryEnd = Color(0xFF764BA2);
  static const Color secondaryStart = Color(0xFFF093FB);
  static const Color secondaryEnd = Color(0xFFF5576C);

  // Neutral Colors
  static const Color darkNeutral = Color(0xFF2C3E50);
  static const Color lightNeutral = Color(0xFFECF0F1);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Status Colors
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF39C12);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF3498DB);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryStart, primaryEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondaryStart, secondaryEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient chakraGradient = LinearGradient(
    colors: [
      rootChakra,
      sacralChakra,
      solarPlexusChakra,
      heartChakra,
      throatChakra,
      thirdEyeChakra,
      crownChakra,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF2C3E50);
  static const Color textSecondary = Color(0xFF7F8C8D);
  static const Color textOnDark = Color(0xFFFFFFFF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Background Colors
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFF1A1A1A);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color overlayBackground = Color(0x80000000);
}