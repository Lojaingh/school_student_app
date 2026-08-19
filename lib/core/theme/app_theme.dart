import 'package:flutter/material.dart';

class AppColors {
  // =========================
  // Primary Colors
  // =========================

  static const Color primary = Color(0xFF1E88E5);
  static const Color primaryLight = Color(0xFF42A5F5);
  static const Color primaryDark = Color(0xFF1565C0);

  // =========================
  // Background
  // =========================

  // خلفية التطبيق فاتحة ومريحة للطالب
  static const Color background = Color(0xFFF7F9FF);

  static const Color backgroundLight = Color(0xFFFFFFFF);

  // لون كحلي مأخوذ من ثيم الـ Dashboard
  static const Color navy = Color(0xFF080B1A);
  static const Color navyLight = Color(0xFF0D1B2E);

  // =========================
  // Cards
  // =========================

  static const Color cardBackground = Colors.white;

  static const Color cardBorder = Color(0xFFE8EAF6);

  // =========================
  // Text
  // =========================

  static const Color textPrimary = Color(0xFF17213A);

  static const Color textSecondary = Color(0xFF64748B);

  static const Color textLight = Color(0xFF94A3B8);

  // =========================
  // Status Colors
  // =========================

  static const Color success = Color(0xFF22C55E);

  static const Color error = Color(0xFFEF4444);

  static const Color warning = Color(0xFFF59E0B);

  static const Color info = Color(0xFF3B82F6);

  // =========================
  // Extra Card Colors
  // =========================

  static const Color purple = Color(0xFF8B5CF6);

  static const Color teal = Color(0xFF14B8A6);

  static const Color pink = Color(0xFFEC4899);

  static const Color orange = Color(0xFFF59E0B);
}

// =====================================================
// Gradients
// =====================================================

class AppGradients {
  // التدرج الأساسي القريب من ثيم الـ Dashboard
  // لكن مخفف حتى يكون مناسب لتطبيق الطالب

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF080B1A),
      Color(0xFF0D1B2E),
      Color(0xFF1E88E5),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradient للـ Header
  static const LinearGradient headerGradient = LinearGradient(
    colors: [
      Color(0xFF080B1A),
      Color(0xFF172554),
      Color(0xFF1E88E5),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradient للكروت المهمة
  static const LinearGradient cardGradient = LinearGradient(
    colors: [
      Color(0xFFEFF6FF),
      Color(0xFFF8FAFF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradient للـ buttons
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFF1565C0),
      Color(0xFF1E88E5),
      Color(0xFF42A5F5),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

// =====================================================
// App Theme
// =====================================================

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.primaryLight,
      surface: Colors.white,
      error: AppColors.error,
    ),

    // =========================
    // AppBar
    // =========================

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: false,
    ),

    // =========================
    // Text
    // =========================

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.textSecondary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColors.textLight,
      ),
    ),

    // =========================
    // Cards
    // =========================

    cardTheme: CardTheme(
      color: AppColors.cardBackground,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        side: BorderSide(
          color: AppColors.cardBorder,
        ),
      ),
    ),

    // =========================
    // Buttons
    // =========================

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // =========================
    // Input Fields
    // =========================

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.cardBorder,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.cardBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),
      hintStyle: const TextStyle(
        color: AppColors.textLight,
      ),
    ),
  );
}
