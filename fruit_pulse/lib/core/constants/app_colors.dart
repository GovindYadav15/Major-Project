import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primaryGreen = Color(0xFF4CAF50);
  static const Color primaryOrange = Color(0xFFFF9800);
  static const Color primaryRed = Color(0xFFF44336);
  static const Color primaryBlue = Color(0xFF2196F3);

  // Background colors
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color darkBackground = Color(0xFF121212);

  // Card colors
  static const Color lightCard = Colors.white;
  static const Color darkCard = Color(0xFF1E1E1E);

  // Text colors
  static const Color lightText = Color(0xFF333333);
  static const Color darkText = Color(0xFFE0E0E0);

  // Gradients
  static const LinearGradient greenGradient = LinearGradient(
    colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient orangeGradient = LinearGradient(
    colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient redGradient = LinearGradient(
    colors: [Color(0xFFF44336), Color(0xFFEF5350)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [Color(0xFF2196F3), Color(0xFF42A5F5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
